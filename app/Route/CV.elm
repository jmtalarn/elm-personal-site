module Route.CV exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import DataModel.CV exposing (CV, cvDecoder)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Json.Decode as Decode
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import UrlPath
import Util.MarkdownProcessor exposing (markdownToView)
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
        pi =
            app.data.cv.personalInfo

        experience =
            app.data.cv.experience
    in
    { title = "jmtalarn CV"
    , body =
        [ Html.h1 [] [ Html.text "jmtalarn CV" ]
        , Html.h2 [] [ Html.text (pi.name ++ " " ++ pi.surnames) ]
        , Html.h3 [] [ Html.text pi.title ]
        , Html.p [] (markdownToView pi.description_md)
        , Html.ul [] (List.map (\xp -> Html.li [] [ Html.text xp.company.name ]) experience)
        ]
    }
