module Components.Footer exposing (..)

import Accessibility.Aria
import Components.Icons.ElmLogo as Logo
import Components.Icons.Icon as Icon
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


socialLink : String -> String -> Phosphor.Icon -> Html msg
socialLink label url icon =
    Html.a (Attribute.href url :: whiteLinksStyle) [ Icon.duotone icon (Just [ Accessibility.Aria.label label ]) ]


footer : Time.Posix -> Html msg
footer now =
    let
        date =
            Date.fromPosix Time.utc now
    in
    Html.footer
        footerStyle
        [ Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            , Attribute.style "gap" "4px"
            ]
            [ socialLink "Link to my profile on Linkedin" "https://www.linkedin.com/in/jmtalarn/" Phosphor.linkedinLogo
            , socialLink "Link to my user account on Github" "https://github.com/jmtalarn" Phosphor.githubLogo
            , socialLink "Link to my user profile on CodePen" "https://codepen.io/jmtalarn" Phosphor.codepenLogo
            , socialLink "Link to my user profile on StackOverflow" "https://stackoverflow.com/cv/jmtalarn/" Phosphor.stackOverflowLogo
            , socialLink "Link to my user account on Twitter" "https://twitter.com/jmtalarn" Phosphor.twitterLogo
            , socialLink "Link to my author profile on Amazon" "https://amzn.to/3T0Xwlz" Phosphor.amazonLogo
            , socialLink "Link to open your default email client to send me an email" "mailto:jmtalarn+site@gmail.com?subject=Message%20from%20the%20site%20jmtalarn" Phosphor.envelope
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
