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
import Components.Ribbon exposing (ribbon)
import Crypto.HMAC exposing (sha256)
import Crypto.Hash
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
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
    { result : String }


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


getAmazonData : EnvVariables -> Time.Posix -> BackendTask FatalError String
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
            "BrowseNodeInfo.BrowseNodes.SalesRank",
            "BrowseNodeInfo.WebsiteSalesRank",
            "CustomerReviews.Count",
            "CustomerReviews.StarRating",
            "Images.Primary.Large",
            "ItemInfo.ByLineInfo",
            "ItemInfo.ContentInfo",
            "ItemInfo.ContentRating",
            "ItemInfo.Classifications",
            "ItemInfo.ExternalIds",
            "ItemInfo.Features",
            "ItemInfo.ManufactureInfo",
            "ItemInfo.ProductInfo",
            "ItemInfo.TechnicalInfo",
            "ItemInfo.Title",
            "ItemInfo.TradeInInfo",
            "Offers.Listings.Availability.Message",
            "Offers.Listings.DeliveryInfo.IsAmazonFulfilled",
            "Offers.Listings.DeliveryInfo.IsFreeShippingEligible",
            "Offers.Listings.DeliveryInfo.IsPrimeEligible",
            "Offers.Listings.MerchantInfo",
            "Offers.Listings.Price",
            "Offers.Listings.Promotions",
            "Offers.Summaries.HighestPrice",
            "Offers.Summaries.LowestPrice",
            "ParentASIN"
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
            , ( "X-Amz-Content-Sha256", jsonPayload |> Crypto.Hash.sha256 )
            , ( "X-Amz-Target", "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems" )

            --, ( "x-amz-target", "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems" )
            , ( "Content-Encoding", "amz-1.0" )
            ]
                |> List.sort

        --|> List.map (\( key, value ) -> ( String.toLower key, value ))
        signedHeaders =
            String.join ";" <| List.map (\( key, _ ) -> String.toLower key) headers

        canonicalRequest =
            "POST\n/paapi5/getitems\n"
                ++ (String.join "\n" <| List.map (\( key, value ) -> String.toLower key ++ ":" ++ value) headers)
                ++ "\n"
                ++ signedHeaders
                ++ "\n"
                ++ (jsonPayload |> Crypto.Hash.sha256)

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
        BackendTask.Http.expectString
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
view _ _ =
    { title = title
    , body =
        [ Html.div
            [ Attribute.style "box-shadow" "0 0 15px rgba(0,0,0,.1)"
            , Attribute.style "padding" "1rem"
            , Attribute.style "margin" "2rem auto"
            , Attribute.style "position" "relative"
            , Attribute.style "max-width" "1024px"
            ]
            [ Html.h2
                [ Attribute.style "margin" "2rem 4rem" ]
                [ Html.span antonFontAttributeStyle
                    [ Html.text "Fundamentos web" ]
                ]
            , Html.h3
                [ Attribute.style "margin" "2rem 4rem" ]
                [ Html.span
                    (antonFontAttributeStyle
                        ++ [ Attribute.style "font-size" "1.5rem" ]
                    )
                    [ Html.text "Fundamentos y conceptos básicos sobre el desarrollo web y manual práctico de la especificación de HTML, Javascript y CSS." ]
                ]
            , Html.p workSansAttributeStyle [ Html.text """Este libro es una guía introductoria a una serie de conceptos, técnicas y herramientas de los conceptos más básicos del desarrollo web. Viajaremos desde los conceptos y siglas más teóricos para introducirnos posteriormente en los aspectos más técnicos de los tres pilares del desarrollo web: HTML, Javascript y CSS.""" ]
            , book3Danimated False
            , ribbon "Book"
            ]
        ]
    }
