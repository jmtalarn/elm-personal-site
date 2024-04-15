module Route.Index exposing (ActionData, Data, Model, Msg, route, view)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import Components.Home exposing (..)
import Components.Ribbon exposing (..)
import DataModel.CV exposing (CV, cvDecoder)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attribute
import List exposing (reverse)
import MimeType exposing (MimeType(..))
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { cv : CV
    }


type alias ActionData =
    {}


getRequest : BackendTask FatalError CV
getRequest =
    BackendTask.Http.getJson
        "https://raw.githubusercontent.com/jmtalarn/manfred-cv-json/main/CV/MAC.json"
        cvDecoder
        |> BackendTask.allowFatal


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data
        |> BackendTask.andMap getRequest


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "jmtalarn.com"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "jmtalarn.com ~ Home "
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    let
        { experience } =
            app.data.cv
    in
    { title = "Joan Maria Talarn ~ web developer"
    , body =
        [ Html.div
            [ Attribute.style "box-shadow" "0 0 15px rgba(0,0,0,.1)"
            , Attribute.style "padding" "5rem 1rem 1rem"
            , Attribute.style "margin" "2rem auto"
            , Attribute.style "position" "relative"
            , Attribute.style "max-width" "1024px"
            ]
            [ hero
            , blog
            , cv
            , companyHighlightSkills experience
            , book
            , ribbon "This is me!"
            ]

        -- , Html.p []
        --     [ Html.text <| "The message is: " ++ app.data.message
        --     ]
        ]
    }
