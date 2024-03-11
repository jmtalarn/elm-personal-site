module Route.Cv exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import Components.Cv exposing (educationSection, experienceSection, personalInfoSection, poweredByManfred)
import DataModel.CV exposing (CV, cvDecoder, sortEducation)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attribute
import MimeType exposing (MimeType(..))
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
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


type alias Data =
    { cv : CV
    }


type alias ActionData =
    {}



-- (Decode.at [ "aboutMe", "profile", "name" ] Decode.field))


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
    BackendTask.succeed Data |> BackendTask.andMap getRequest



-- |> BackendTask.andMap
--     (BackendTask.succeed "Hello!")


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
        , description = "Web developer"
        , locale = Nothing
        , title = "jmtalarn.com ~ CV web developer "
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    let
        { personalInfo, experience, education } =
            app.data.cv
    in
    { title = "jmtalarn CV"
    , body =
        [ Html.h1 [] [ Html.text "jmtalarn CV" ]
        , personalInfoSection personalInfo
        , Html.h2 [] [ Html.text "Working experience" ]
        , experienceSection experience
        , Html.h2 [] [ Html.text "Education" ]
        , educationSection (sortEducation education)
        , Html.h2 [] [ Html.text "Aside projects" ]
        , poweredByManfred
        ]
    }
