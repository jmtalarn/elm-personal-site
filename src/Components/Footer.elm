module Components.Footer exposing (..)

import Components.Logo as Logo
import Date exposing (Date)
import Html exposing (Html)
import Html.Attributes as Attribute
import Route exposing (Route)
import Time


footerStyle : List (Html.Attribute msg)
footerStyle =
    [ Attribute.style "color" "white"
    , Attribute.style "background-color" "dimGray"
    , Attribute.style "padding" ".5rem"
    , Attribute.style "display" "flex"
    , Attribute.style "align-items" "center"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "font-size" ".8rem"
    ]


footer : Time.Posix -> Html msg
footer now =
    let
        date =
            Date.fromPosix Time.utc now
    in
    Html.footer
        footerStyle
        [ Html.span
            []
            [ Html.text "This is the footer" ]
        , Html.span
            []
            [ Html.text ("©️ " ++ String.fromInt (Date.year date) ++ " Joan Maria Talarn Espelta") ]
        , Html.span
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            ]
            [ Html.text "Made with "
            , Logo.view
                [ Attribute.style "width" "2rem"
                , Attribute.style "filter" "brightness(0) invert(1)"
                ]
                Logo.modelHeart
            , Html.text " and Elm "
            , Logo.view
                [ Attribute.style "width" "2rem"
                , Attribute.style "filter" "brightness(0) invert(1)"
                ]
                Logo.modelStart
            ]
        ]
