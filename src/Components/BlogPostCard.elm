module Components.BlogPostCard exposing (..)

-- https://elmprogramming.com/commands.html#wiring-everything-up Sandbox

import Browser
import DataModel.BlogPosts exposing (BlogPost)
import Date
import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Route


type alias Model =
    { hoverCard : Bool }


init : Model
init =
    { hoverCard = False }


type Msg
    = HoveringCard
    | NotHoveringCard


update : Msg -> Model -> ( Model, Effect msg )
update msg model =
    case msg of
        HoveringCard ->
            ( { model | hoverCard = True }, Effect.none )

        NotHoveringCard ->
            ( { model | hoverCard = False }, Effect.none )


blogPostCardStyle : Bool -> List (Html.Attribute Msg)
blogPostCardStyle hovering =
    [ Attribute.style "display" "flex"
    , Attribute.style "flex-direction" "column"
    , Attribute.style "margin" "1rem"

    --, Attribute.style "border" "1px solid grey"
    , Attribute.style "border-radius"
        "10px"
    , if hovering then
        Attribute.style "box-shadow" "0 4px 8px 0 rgba(0, 0, 0, 0.2)"

      else
        Attribute.style "box-shadow" "0 8px 16px 0 rgba(0, 0, 0, 0.2)"
    , Html.Events.onMouseOver HoveringCard
    , Html.Events.onMouseOut NotHoveringCard
    ]


blogPostCardHeaderStyle : String -> List (Html.Attribute msg)
blogPostCardHeaderStyle cover =
    [ Attribute.style
        "background-image"
        ("""linear-gradient(
                rgba(0, 0, 0, 0.7), 
                rgba(0, 0, 0, 0.7)
            ),
            url(\""""
            ++ cover
            ++ """")"""
        )
    , Attribute.style "background-repeat" "no-repeat"
    , Attribute.style "background-position" "center"
    , Attribute.style "background-size" "cover"
    , Attribute.style "border-radius" "10px 10px 0 0"
    , Attribute.style "padding" "1rem"
    , Attribute.style "color" "white"
    , Attribute.style "text-shadow" "2px 2px 2px black"
    ]


whiteLinksStyle : List (Html.Attribute msg)
whiteLinksStyle =
    [ Attribute.style "text-decoration" "none"
    , Attribute.style "color" "inherit"
    ]


blogPostCardContentStyle : List (Html.Attribute msg)
blogPostCardContentStyle =
    [ Attribute.style "padding" "1rem" ]


blogPostCard : BlogPost -> Html msg
blogPostCard { title, slug, date, cover } =
    Html.article
        blogPostCardStyle
        [ Html.header
            (blogPostCardHeaderStyle cover)
            [ Route.Blog__Post_ { post = slug }
                |> Route.link whiteLinksStyle
                    [ Html.h3 [ Attribute.style "margin" "0" ] [ Html.text title ]
                    ]
            ]
        , Html.div
            blogPostCardContentStyle
            [ Html.span [ Attribute.style "font-size" "0.8rem" ] [ Html.text ("📅 " ++ Date.format "d, MMMM y" date) ] ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = blogPostCard
        , update = update
        }
