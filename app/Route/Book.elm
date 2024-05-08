module Route.Book exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import BackendTask.Http
import BackendTask.Time
import Components.Book exposing (book3Danimated)
import Components.Home exposing (antonFontAttributeStyle, workSansAttributeStyle)
import Components.Ribbon exposing (ribbon)
import Date
import Dict
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
import Time
import UrlPath
import View exposing (View)


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
    {}



-- ENDPOINT
-- webservices.amazon.es/paapi5/getitems
-- HEADERS
-- Host: webservices.amazon.es
-- X-Amz-Date: 20240507T215117Z
-- X-Amz-Target: com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems
-- Content-Encoding: amz-1.0
-- json payload
-- {
--  "ItemIds": [
--   "B08N5S5BHD"
--  ],
--  "Resources": [
--   "BrowseNodeInfo.BrowseNodes",
--   "BrowseNodeInfo.BrowseNodes.SalesRank",
--   "BrowseNodeInfo.WebsiteSalesRank",
--   "CustomerReviews.Count",
--   "CustomerReviews.StarRating",
--   "Images.Primary.Large",
--   "ItemInfo.ByLineInfo",
--   "ItemInfo.ContentInfo",
--   "ItemInfo.ContentRating",
--   "ItemInfo.Features",
--   "ItemInfo.ProductInfo",
--   "ItemInfo.TechnicalInfo",
--   "ItemInfo.Title",
--   "Offers.Listings.Availability.Message",
--   "Offers.Listings.Availability.Type",
--   "Offers.Listings.DeliveryInfo.IsFreeShippingEligible",
--   "Offers.Listings.DeliveryInfo.IsPrimeEligible",
--   "Offers.Listings.Price"
--  ],
--  "PartnerTag": "blog-jmtalarn-21",
--  "PartnerType": "Associates",
--  "Marketplace": "www.amazon.es",
--  "Operation": "GetItems"
-- }


getAmazonData : BackendTask FatalError String
getAmazonData =
    let
        now =
            String.concat [ Maybe.withDefault "" (List.head <| String.split "." <| String.replace ":" "" <| String.replace "-" "" (Iso8601.fromTime <| Pages.builtAt)), "Z" ]

        _ =
            Debug.log "now" now

        headers =
            Dict.fromList
                [ ( "Host", "webservices.amazon.es" )
                , ( "X-Amz-Date", now )
                , ( "X-Amz-Target", "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems" )
                , ( "Content-Encoding", "amz-1.0" )
                ]
    in
    BackendTask.Http.get
        "https://api.github.com/repos/dillonkearns/elm-pages"
        BackendTask.Http.expectString
        |> BackendTask.allowFatal


data : BackendTask FatalError Data
data =
    let
        _ =
            Debug.log "getAmazonData" getAmazonData
    in
    BackendTask.succeed {}


title : String
title =
    "jmtalarn.com ~ Fundamentos web"


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
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
view app shared =
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
