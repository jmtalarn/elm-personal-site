module Components.Footer exposing (..)

import Components.ElmLogo as Logo
import Components.Icon as Icon
import Date exposing (Date)
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor
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
    , Attribute.style "text-wrap" "balance"
    , Attribute.style "gap" "0.5rem"
    , Attribute.style "flex-wrap" "wrap"
    ]


whiteLinksStyle : List (Html.Attribute msg)
whiteLinksStyle =
    [ Attribute.style "text-decoration" "none"
    , Attribute.style "color" "inherit"
    ]


socialLink : String -> Phosphor.Icon -> Html msg
socialLink url icon =
    Html.a (Attribute.href url :: whiteLinksStyle) [ Icon.duotone icon Nothing ]


footer : Time.Posix -> Html msg
footer now =
    let
        date =
            Date.fromPosix Time.utc now
    in
    Html.footer
        footerStyle
        [ Html.div
            []
            [ socialLink "https://www.linkedin.com/in/jmtalarn/" Phosphor.linkedinLogo
            , socialLink "https://github.com/jmtalarn" Phosphor.githubLogo
            , socialLink "https://codepen.io/jmtalarn" Phosphor.codepenLogo
            , socialLink "https://stackoverflow.com/cv/jmtalarn/" Phosphor.stackOverflowLogo
            , socialLink "https://twitter.com/jmtalarn" Phosphor.twitterLogo
            , socialLink "https://amzn.to/3T0Xwlz" Phosphor.amazonLogo
            , socialLink "mailto:jmtalarn+blog@gmail.com?subject=Message%20from%20the%20blog%20jmtalarn" Phosphor.envelope
            ]
        , Html.div
            []
            [ Html.text ("©️ " ++ String.fromInt (Date.year date) ++ " Joan Maria Talarn Espelta") ]
        , Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            ]
            [ Html.span [ Attribute.style "text-align" "right" ] [ Html.text "Made with" ]
            , Logo.view
                [ Attribute.style "width" "2rem"
                , Attribute.style "filter" "brightness(0) invert(1)"
                ]
                Logo.modelHeart
            , Html.span [ Attribute.style "text-align" "right" ] [ Html.text "and Elm" ]
            , Logo.view
                [ Attribute.style "width" "2rem"
                , Attribute.style "filter" "brightness(0) invert(1)"
                ]
                Logo.modelStart
            ]
        ]
