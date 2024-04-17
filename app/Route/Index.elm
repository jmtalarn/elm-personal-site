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
import Route
import RouteBuilder exposing (App, StatefulRoute)
import Shared
import Time
import UrlPath
import View exposing (View)


type alias Model =
    { left : Animator.Timeline Int }


animator : Animator.Animator Model
animator =
    Animator.animator
        |> Animator.watching
            .left
            (\newLeft model -> { model | left = newLeft })


type Msg
    = SwiftLeft Int
    | Tick Time.Posix


type StatesOfSwift
    = HIDE
    | MOVE Int
    | SHOW


type alias RouteParams =
    {}


type alias Data =
    { cv : CV
    }


type alias ActionData =
    {}


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
                | left =
                    model.left
                        --|> Animator.go Animator.slowly (modBy length (Animator.current model.left + 1)) }, Effect.none )
                        |> Animator.queue
                            [ Animator.event Animator.quickly HIDE
                            , Animator.event Animator.quickly <| MOVE (modBy length (Animator.current model.left + 1))
                            , Animator.event Animator.quickly SHOW
                            ]
              }
            , Effect.none
            )

        Tick newTime ->
            ( model
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


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( { left = Animator.init 0 }
    , Effect.none
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
            , companyHighlightSkills experience model.left
            , book
            , ribbon "This is me!"
            ]

        -- , Html.p []
        --     [ Html.text <| "The message is: " ++ app.data.message
        --     ]
        ]
    }


companyHighlightSkills : List Job -> Animator.Timeline Int -> Html (PagesMsg Msg)
companyHighlightSkills jobs swiftValueLeft =
    Html.div
        [ Attribute.style "display" "block"
        , Attribute.style "white-space" "nowrap"

        --, Attribute.style "transform" "translateX(calc(-n*100% - n*1rem))"
        ]
        [ Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "gap" "1rem"
            , Events.onClick (PagesMsg.fromMsg (SwiftLeft <| List.length jobs))
            , Animator.Inline.style swiftValueLeft
                "transform"
                --(\f -> "translate( calc( (" ++ String.fromFloat f ++ " * -100%) - " ++ String.fromFloat f ++ "*1rem - " ++ String.fromFloat f ++ "*2px ), 0) ")
                (\f -> "translate( calc( (" ++ String.fromFloat f ++ " * -100%) - " ++ String.fromFloat f ++ "*1rem ), 0) ")
                (\state ->
                    Animator.at <|
                        toFloat state
                )
            ]
            (List.map companySkillHighlight jobs)
        ]
