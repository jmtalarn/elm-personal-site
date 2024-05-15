module Route.Book exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import BackendTask.Env
import BackendTask.Http
import BackendTask.Time
import Bytes.Encode
import Components.Book exposing (book3Danimated)
import Components.Home exposing (antonFontAttributeStyle, workSansAttributeStyle)
import Components.Icons.Home as HomeIcon
import Components.Ribbon exposing (ribbon)
import Crypto.HMAC exposing (sha256)
import Crypto.Hash
import DataModel.Book exposing (..)
import Elm exposing (just)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attribute
import Iso8601
import LanguageTag
import LanguageTag.Language
import Pages
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import String.Extra
import Time
import UrlPath
import View exposing (View)
import Word.Bytes as Bytes
import Word.Hex as Hex


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


type alias Data =
    { result : List Item }


type alias EnvVariables =
    { asinKindle : String
    , asinBook : String
    , tag : String
    , key : String
    , secret : String
    }


getEnvVariables : BackendTask FatalError EnvVariables
getEnvVariables =
    BackendTask.map5 EnvVariables
        (BackendTask.Env.expect "PA_API_KINDLE_ASIN" |> BackendTask.allowFatal)
        (BackendTask.Env.expect "PA_API_BOOK_ASIN" |> BackendTask.allowFatal)
        (BackendTask.Env.expect "PA_API_TAG" |> BackendTask.allowFatal)
        (BackendTask.Env.expect "PA_API_KEY" |> BackendTask.allowFatal)
        (BackendTask.Env.expect "PA_API_SECRET" |> BackendTask.allowFatal)


getAmazonData : EnvVariables -> Time.Posix -> BackendTask FatalError (List Item)
getAmazonData vars nowTask =
    let
        now =
            String.concat [ Maybe.withDefault "" (List.head <| String.split "." <| String.replace ":" "" <| String.replace "-" "" (Iso8601.fromTime <| nowTask)), "Z" ]

        nowShort =
            Maybe.withDefault "YYYYMMDD" <|
                List.head (String.split "T" now)

        jsonPayload =
            """{
            "ItemIds": [
            \"""" ++ vars.asinKindle ++ "\",\"" ++ vars.asinBook ++ """"
            ],
            "Resources": [
                "BrowseNodeInfo.BrowseNodes",
                "BrowseNodeInfo.BrowseNodes.SalesRank",
                "BrowseNodeInfo.WebsiteSalesRank",
                "CustomerReviews.Count",
                "CustomerReviews.StarRating",
                "Images.Primary.Large",
                "Images.Primary.Medium",
                "Images.Primary.Small",
                "Images.Variants.Large",
                "Images.Variants.Medium",
                "Images.Variants.Small",
                "ItemInfo.ByLineInfo",
                "ItemInfo.ContentInfo",
                "ItemInfo.Features",
                "ItemInfo.ProductInfo",
                "ItemInfo.TechnicalInfo",
                "ItemInfo.Title",
                "ItemInfo.TradeInInfo",
                "Offers.Listings.Availability.Message",
                "Offers.Listings.DeliveryInfo.IsAmazonFulfilled",
                "Offers.Listings.DeliveryInfo.IsFreeShippingEligible",
                "Offers.Listings.DeliveryInfo.IsPrimeEligible",
                "Offers.Listings.DeliveryInfo.ShippingCharges",
                "Offers.Listings.Price",
                "Offers.Listings.Promotions",
                "Offers.Listings.SavingBasis",
                "Offers.Summaries.HighestPrice",
                "Offers.Summaries.LowestPrice",
                "Offers.Summaries.OfferCount"
            ],
            "PartnerTag": \"""" ++ vars.tag ++ """",
            "PartnerType": "Associates",
            "Marketplace": "www.amazon.es",
            "Operation": "GetItems"
            }
        """ |> String.Extra.clean

        _ =
            Debug.log "JSON" jsonPayload

        headers =
            [ ( "Host", "webservices.amazon.es" )
            , ( "Content-Type", "application/json" ) -- "application/json; charset=UTF-8" )
            , ( "X-Amz-Date", now )

            --, ( "X-Amz-Content-Sha256", jsonPayload |> Crypto.Hash.sha256 )
            , ( "X-Amz-Target", "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems" )

            --, ( "x-amz-target", "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems" )
            , ( "Content-Encoding", "amz-1.0" )
            ]
                |> List.sort

        --|> List.map (\( key, value ) -> ( String.toLower key, value ))
        signedHeaders =
            String.join ";" <| List.map (\( key, _ ) -> String.toLower key) headers

        canonicalRequest =
            [ "POST"
            , """/paapi5/getitems"""
            , """"""
            ]
                ++ List.map (\( key, value ) -> String.toLower key ++ ":" ++ value) headers
                ++ [ """"""
                   , signedHeaders
                   , jsonPayload |> Crypto.Hash.sha256
                   ]
                |> String.join "\n"

        hashCanonicalRequest =
            canonicalRequest |> Crypto.Hash.sha256

        stringtosign =
            "AWS4-HMAC-SHA256\n" ++ now ++ "\n" ++ nowShort ++ "/eu-west-1/ProductAdvertisingAPI/aws4_request\n" ++ hashCanonicalRequest

        digest =
            \message key ->
                Crypto.HMAC.digestBytes sha256
                    key
                    (Bytes.fromUTF8 message)

        signature =
            ("AWS4" ++ vars.secret) |> Bytes.fromUTF8 |> digest nowShort |> digest "eu-west-1" |> digest "ProductAdvertisingAPI" |> digest "aws4_request" |> digest stringtosign |> Hex.fromByteList

        headersAndExtraHeaders =
            headers
                ++ [ ( "Authorization", "AWS4-HMAC-SHA256 Credential=" ++ vars.key ++ "/" ++ nowShort ++ "/eu-west-1/ProductAdvertisingAPI/aws4_request, SignedHeaders=" ++ signedHeaders ++ ", Signature=" ++ signature ++ "" )
                   , ( "Content-Length", String.fromInt <| Bytes.Encode.getStringWidth jsonPayload )
                   ]

        _ =
            Debug.log "Headers" headersAndExtraHeaders
    in
    BackendTask.Http.request
        { url = "https://webservices.amazon.es/paapi5/getitems"
        , method = "POST"
        , headers = headersAndExtraHeaders
        , body = BackendTask.Http.stringBody "application/json" jsonPayload
        , retries = Just 1
        , timeoutInMs = Just 3000
        }
        (BackendTask.Http.expectJson
            responseDecoder
        )
        |> BackendTask.onError
            (\error ->
                case error.recoverable of
                    BackendTask.Http.BadStatus metadata string ->
                        let
                            _ =
                                Debug.log "statusCode" metadata.statusCode

                            _ =
                                Debug.log "statusText" metadata.statusText

                            _ =
                                Debug.log "metadata" metadata

                            _ =
                                Debug.log "string" string
                        in
                        -- if metadata.statusCode == 401 || metadata.statusCode == 403 || metadata.statusCode == 404 then
                        --     BackendTask.succeed "Either this repo doesn't exist or you don't have access to it."
                        -- else
                        --     -- we're only handling these expected error cases. In the case of an HTTP timeout,
                        --     -- we'll let the error propagate as a FatalError
                        BackendTask.fail error |> BackendTask.allowFatal

                    _ ->
                        BackendTask.fail error |> BackendTask.allowFatal
            )
        |> BackendTask.map (\response -> response.itemsResult.items)


data : BackendTask FatalError Data
data =
    BackendTask.map Data
        (getEnvVariables
            |> BackendTask.andThen
                (\envVariables ->
                    BackendTask.Time.now
                        |> BackendTask.andThen
                            (\nowFromTask -> getAmazonData envVariables nowFromTask)
                )
        )


title : String
title =
    "jmtalarn.com ~ Fundamentos web"


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head _ =
    (Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = title
        , image =
            { url = [ "images", "home", "openart-image_Ko4Z9KtJ_1712956581329_raw.jpg" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "jmtalarn an AI generated image to illustrate my blog, web dev notes"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Fundamentos web. Libro autopublicado en Amazon. "
        , locale = Nothing
        , title = title
        }
        |> Seo.website
    )
        ++ [ LanguageTag.Language.es
                |> LanguageTag.build LanguageTag.emptySubtags
                |> Head.rootLanguage
           ]


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app _ =
    let
        _ =
            Debug.log "Data" app.data
    in
    { title = title
    , body =
        [ Html.div
            [ Attribute.style "box-shadow" "0 0 15px rgba(0,0,0,.1)"
            , Attribute.style "padding" "1rem"
            , Attribute.style "margin" "2rem auto"
            , Attribute.style "position" "relative"
            , Attribute.style "max-width" "1024px"
            ]
            [ Html.div
                [ Attribute.style "display" "flex"
                , Attribute.style "flex-wrap" "wrap"
                , Attribute.style "position" "relative"
                ]
                [ Html.div
                    [ Attribute.style "flex" "1 0 60%"
                    , Attribute.style "display" "flex"
                    , Attribute.style "align-items" "start"
                    , Attribute.style "flex-direction" "column"
                    , Attribute.style "justify-content" "center"
                    ]
                    [ Html.h2
                        [ Attribute.style "margin" "2rem 4rem" ]
                        [ Html.span antonFontAttributeStyle
                            [ Html.text "Fundamentos web" ]
                        ]
                    , Html.h3
                        [ Attribute.style "margin" "2rem 4rem"
                        , Attribute.style "color" "cadetblue"
                        ]
                        [ Html.span
                            (antonFontAttributeStyle
                                ++ [ Attribute.style "font-size" "1.5rem" ]
                            )
                            [ Html.text "Fundamentos y conceptos básicos sobre el desarrollo web y manual práctico de la especificación de HTML, Javascript y CSS." ]
                        ]
                    ]
                , Html.div [ Attribute.style "flex" "1 0 40%" ] [ book3Danimated False ]
                , Html.div
                    [ Attribute.style "position" "absolute"
                    , Attribute.style "top" "0"
                    , Attribute.style "left" "0"
                    , Attribute.style "width" "100%"
                    , Attribute.style "height" "90%"
                    , Attribute.style "z-index" "-1"
                    , Attribute.style "background-color" "aliceblue"
                    ]
                    []
                ]
            , Html.hr [] []
            , Html.p
                (workSansAttributeStyle
                    ++ [ Attribute.style "max-width" "700px"
                       , Attribute.style "margin" "4rem auto 6rem auto"
                       , Attribute.style "text-align" "justify"
                       ]
                )
                [ Html.text """Este libro es una guía introductoria a una serie de conceptos, técnicas y herramientas de los conceptos más básicos del desarrollo web. Viajaremos desde los conceptos y siglas más teóricos para introducirnos posteriormente en los aspectos más técnicos de los tres pilares del desarrollo web: HTML, Javascript y CSS.""" ]
            , Html.div []
                [ Html.h4 []
                    [ Html.text "Points explained in this book" ]
                , Html.ul []
                    [ Html.li [] [ Html.text "Point one" ]
                    , Html.li [] [ Html.text "Point 2" ]
                    , Html.li [] [ Html.text "Point III" ]
                    , Html.li [] [ Html.text "Fourth point" ]
                    , Html.li [] [ Html.text "Point V" ]
                    ]
                ]
            , Html.div
                [ Attribute.style "display" "flex"
                , Attribute.style "flex-wrap" "wrap"
                , Attribute.style "gap" "1rem"
                , Attribute.style "justify-content" "center"
                ]
                (List.map showItem app.data.result)
            , ribbon "Book"
            ]
        ]
    }


listing : Listing -> Html msg
listing listingData =
    Html.div []
        [ Html.strong [] [ Html.text "Precio " ]
        , Html.text listingData.price.displayAmount
        ]


showItem : Item -> Html msg
showItem item =
    let
        _ =
            Debug.log "Item" item

        ebookCopy =
            "Hazte con el libro en su versión digital en la plataforma Kindle de Amazon. Llévate tu copia en e-book a todos lados con tu dispositivo favorito de lectura."

        paperBookCopy =
            \pages ->
                "Consigue tu copia física del libro en papel en blanco y negro. " ++ pages ++ " páginas de útil información. Envíado con la garantía de Amazon."

        isEbook =
            List.member True <| List.map (\{ displayName } -> displayName == "eBooks Kindle en español") item.browseNodeInfo.browseNodes

        isPaperBook =
            List.member True <| List.map (\{ displayName } -> displayName == "Libros físicos") item.browseNodeInfo.browseNodes

        isKindleUnlimited =
            List.member True <| List.map (\{ displayName } -> displayName == "Kindle Unlimited") item.browseNodeInfo.browseNodes
    in
    Html.article
        [ Attribute.style "text-decoration" "none"
        , Attribute.style "color" "inherit"
        , Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "column"
        , Attribute.style "gap" "1rem"
        , Attribute.style "margin" "1rem"
        , Attribute.style "box-shadow" "0px 0px 1px grey"
        , Attribute.style "border-radius" "5px"
        , Attribute.style "padding" "1rem"
        , Attribute.style "flex" "0 1 100%"
        , Attribute.style "position" "relative"
        ]
        [ Html.header
            [ Attribute.style "display" "flex"
            , Attribute.style "flex-wrap" "wrap"
            , Attribute.style "justify-content" "space-between"
            , Attribute.style "align-items" "center"
            ]
            [ Html.h4 [ Attribute.style "margin" "0" ] [ Html.text item.itemInfo.title.displayValue ]
            , Html.div
                (workSansAttributeStyle
                    ++ [ Attribute.style "font-size" "0.8rem"
                       , Attribute.style "font-weight" "bold"
                       , Attribute.style "color" "slategrey"

                       --, Attribute.style "text-shadow" "2px 2px 1px orange"
                       , Attribute.style "border-bottom" "4px solid orange"
                       ]
                )
                [ if isEbook then
                    Html.text "e-book Versión Kindle"

                  else if isPaperBook then
                    Html.text "Libro en edición impresa"

                  else
                    Html.text ""
                ]
            ]
        , Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "flex-start"
            , Attribute.style "flex-direction" "row"
            , Attribute.style "gap" "1rem"
            ]
            [ Html.img
                [ Attribute.src item.images.primary.medium.url, Attribute.width item.images.primary.medium.width, Attribute.height item.images.primary.medium.height ]
                []
            , Html.div []
                (if isEbook then
                    [ Html.p [ Attribute.style "margin" "0" ] [ Html.text ebookCopy ]
                    ]

                 else if isPaperBook then
                    [ Html.p [ Attribute.style "margin" "0" ] [ Html.text (String.fromFloat item.itemInfo.contentInfo.pagesCount.displayValue |> paperBookCopy) ] ]

                 else
                    []
                )
            ]
        , Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "gap" "2rem"
            , Attribute.style "justify-content" "space-between"
            ]
            [ Html.div []
                (List.map
                    listing
                    item.offers.listings
                )
            , Html.a
                [ Attribute.href item.detailPageURL
                , Attribute.title "Clic aquí para más detalles"
                ]
                [ Html.text "Más detalles en Amazon" ]
            ]
        , kindleUnlimited isKindleUnlimited
        ]


kindleUnlimited : Bool -> Html msg
kindleUnlimited isKindleUnlimited =
    let
        kindleUnlimitedLink =
            "https://amzn.to/4bE3osw"
    in
    if isKindleUnlimited then
        Html.div [ Attribute.style "display" "flex", Attribute.style "margin" "1rem -1rem -1rem -1rem" ]
            [ Html.a
                [ Attribute.style "display" "flex"
                , Attribute.style "align-items" "center"
                , Attribute.style "flex" "1 0 100%"

                --, Attribute.style "margin" "1rem -1rem -1rem -1rem"
                --, Attribute.style "justify-content" "center"
                , Attribute.href kindleUnlimitedLink
                , Attribute.style "text-decoration" "none"
                , Attribute.style "background-color" "orange"
                , Attribute.style "color" "slategrey"
                ]
                [ Html.div
                    [ Attribute.style "display" "flex"
                    , Attribute.style "gap" ".3rem"
                    , Attribute.style "align-items" "center"
                    , Attribute.style "flex-wrap" "wrap"
                    , Attribute.style "background-color" "slategrey"
                    , Attribute.style "color" "white"
                    , Attribute.style "padding" "1rem 2rem"
                    , Attribute.style "clip-path" "polygon(0% 0%, 95% 0%, 100% 50%, 95% 100%, 0% 100%)"
                    ]
                    [ Html.text "Consíguelo por 0 € con "
                    , HomeIcon.amazonKindle
                        [ Attribute.title "Amazon Kindle"
                        , Attribute.style "height" "1.2rem"
                        , Attribute.style "width" "auto"
                        ]
                    , Html.span [ Attribute.style "font-style" "italic", Attribute.style "font-weight" "bolder" ] [ Html.text "Unlimited" ]
                    ]
                , Html.div
                    [ Attribute.style "display" "flex"
                    , Attribute.style "align-items" "center"
                    , Attribute.style "padding" "1rem 2rem"

                    --, Attribute.style "left" "-1.2rem"
                    --, Attribute.style "position" "relative"
                    --, Attribute.style "z-index" "-1"
                    , Attribute.style "font-weight" "bolder"
                    , Attribute.style "color" "slategrey"

                    --, Attribute.style "clip-path" "polygon(100% 0, 100% 100%, 0% 100%, 5% 50%, 0% 0%)"
                    ]
                    [ Html.text "Pruébalo 30 días gratis."
                    ]
                ]
            ]

    else
        Html.text ""
