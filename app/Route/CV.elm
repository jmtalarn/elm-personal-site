module Route.Cv exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import Components.Cv exposing (asideProjectsSection, educationSection, experienceSection, personalInfoSection, poweredByManfred)
import DataModel.CV exposing (CV, cvDecoder, sortEducation)
import Effect
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
    { selectedSkills : List String }


type Msg
    = ToggleSkill String


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    case msg of
        ToggleSkill tag ->
            ( { model
                | selectedSkills =
                    if List.member tag model.selectedSkills then
                        List.filter (\a -> a /= tag) model.selectedSkills

                    else
                        tag :: model.selectedSkills
              }
            , Effect.none
            )


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
        |> RouteBuilder.buildWithLocalState
            { view = view
            , init = init
            , update = update
            , subscriptions = \_ _ _ _ -> Sub.none
            }


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( { selectedSkills = [] }, Effect.none )


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
    -> Model
    -> View (PagesMsg Msg)
view app shared { selectedSkills } =
    let
        { personalInfo, experience, education, asideProjects } =
            app.data.cv
    in
    { title = "jmtalarn ~ Web developer { Frontend developer } CV"
    , body =
        [ personalInfoSection personalInfo
        , Html.h2 [] [ Html.text "Working experience" ]
        , experienceSection ToggleSkill experience
        , Html.h2 [] [ Html.text "Education" ]
        , educationSection ToggleSkill (sortEducation education)
        , Html.h2 [] [ Html.text "Aside projects" ]
        , asideProjectsSection ToggleSkill asideProjects
        , poweredByManfred
        ]
    }
