module Route.Book exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import BackendTask.Http
import Components.Book exposing (book3Danimated)
import Components.Home exposing (antonFontAttributeStyle, workSansAttributeStyle)
import Components.Ribbon exposing (ribbon)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attribute
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
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


getAmazonData : BackendTask (FatalError Error) String
getAmazonData =
    BackendTask.Http.get
        "https://api.github.com/repos/dillonkearns/elm-pages"
        BackendTask.Http.expectString


data : BackendTask FatalError Data
data =
    BackendTask.succeed {}


title : String
title =
    "jmtalarn.com ~ Fundamentos web"


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = title
        , image =
            { url = [ "images", "home", "openart-image_Ko4Z9KtJ_1712956581329_raw.jpg" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "jmtalarn an AI generated image to illustrate my blog, web dev notes"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "My book fundamentos web"
        , locale = Nothing
        , title = title
        }
        |> Seo.website


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
                [ Attribute.style "margin-left" "4rem" ]
                [ Html.span antonFontAttributeStyle
                    [ Html.text "Fundamentos web - el libro" ]
                ]
            , book3Danimated False
            , ribbon "Book"
            ]
        ]
    }
