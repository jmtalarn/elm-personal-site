module Route.Index exposing (ActionData, Data, Model, Msg, route, view)

import Animator
import Animator.Inline
import BackendTask exposing (BackendTask)
import BackendTask.Http
import Components.CompanySkillHighlight exposing (companySkillHighlight)
import Components.Home exposing (..)
import Components.Ribbon exposing (..)
import DataModel.CV exposing (CV, Job, cvDecoder)
import Effect
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events as Events
import MimeType exposing (MimeType(..))
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Process
import Route
import RouteBuilder exposing (App, StatefulRoute)
import Shared
import Task
import Time
import UrlPath
import View exposing (View)


type alias State =
    { position : Int
    , opacity : Int
    }


type alias Model =
    { state : Animator.Timeline State, tickCount : Int }


animator : Animator.Animator Model
animator =
    Animator.animator
        |> Animator.watching
            .state
            (\newState model -> { model | state = newState })


type Msg
    = SwiftLeft Int
    | Tick Time.Posix


type alias RouteParams =
    {}


type alias Data =
    { cv : CV
    }


type alias ActionData =
    {}


sleepAndSwiftLeft : Int -> Cmd Msg
sleepAndSwiftLeft length =
    Process.sleep 4000
        |> Task.perform (\_ -> SwiftLeft length)


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    case msg of
        SwiftLeft length ->
            ( { model
                | state =
                    Animator.queue
                        [ Animator.event (Animator.seconds 0.2)
                            { position = Animator.current model.state |> .position, opacity = 0 }
                        , Animator.event (Animator.seconds 0.1) { position = modBy length ((Animator.current model.state |> .position) + 1), opacity = 0 }
                        , Animator.event
                            (Animator.seconds 0.2)
                            { position = modBy length ((Animator.current model.state |> .position) + 1), opacity = 1 }
                        ]
                        model.state
                , tickCount = initialTickCount
              }
            , Effect.none
              --Effect.fromCmd (sleepAndSwiftLeft length)
            )

        Tick newTime ->
            let
                { tickCount } =
                    model
            in
            if tickCount == 0 then
                update app shared (SwiftLeft (List.length app.data.cv.experience)) { model | tickCount = initialTickCount }
                -- ( { model | tickCount = initialTickCount } |> Animator.update newTime animator, Effect.fromCmd (Cmd.map (always SwiftLeft (List.length app.data.cv.experience)) Cmd.none) )

            else
                ( { model | tickCount = model.tickCount - 1 }
                    |> Animator.update newTime animator
                , Effect.none
                )


getRequest : BackendTask FatalError CV
getRequest =
    BackendTask.Http.getJson
        "https://raw.githubusercontent.com/jmtalarn/manfred-cv-json/main/CV/MAC.json"
        cvDecoder
        |> BackendTask.allowFatal


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildWithLocalState
            { view = view
            , init = init
            , update = update
            , subscriptions = subscriptions
            }


subscriptions :
    RouteParams
    -> UrlPath.UrlPath
    -> Shared.Model
    -> Model
    -> Sub Msg
subscriptions routeParams path shared model =
    animator
        |> Animator.toSubscription Tick model


initialTickCount : Int
initialTickCount =
    450


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( { state = Animator.init { position = 0, opacity = 1 }, tickCount = initialTickCount }
    , Effect.none
      --fromCmd (sleepAndSwiftLeft (List.length app.data.cv.experience))
    )


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
    -> Model
    -> View (PagesMsg Msg)
view app shared model =
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
            , companyHighlightSkills experience model.state
            , book
            , ribbon "This is me!"
            ]
        ]
    }


companyHighlightSkills : List Job -> Animator.Timeline State -> Html (PagesMsg Msg)
companyHighlightSkills jobs state =
    Html.div
        [ Attribute.style "display" "block"
        , Attribute.style "white-space" "nowrap"
        , Attribute.style "overflow" "hidden"
        , Attribute.style "cursor" "pointer"
        , Attribute.class "cards-container"
        , Attribute.style "padding" "1rem"
        , Attribute.title "Click to switch experience!"
        , Attribute.style "position" "relative"
        ]
        [ Html.node "style" [] [ Html.text """
            .cards-container .card {
                box-sizing: border-box;
                box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
                transition: box-shadow 100ms ease-in;
            }
            .cards-container .card:hover {
                box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
            }
        """ ]
        , Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "gap" "2rem"
            , Events.onClick (PagesMsg.fromMsg (SwiftLeft <| List.length jobs))
            , Animator.Inline.style
                state
                "transform"
                (\f -> "translate( calc( (" ++ String.fromFloat f ++ " * -100%) - " ++ String.fromFloat f ++ "*2rem ), 0) ")
                (\state_ ->
                    Animator.at <|
                        toFloat state_.position
                )
            , Animator.Inline.opacity state (\state_ -> Animator.at <| toFloat state_.opacity)
            ]
            (List.map companySkillHighlight jobs)
        , featuredSkillsAndCompaniesLabel
        ]
