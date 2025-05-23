module Components.NavBar exposing (..)

-- import Effect exposing (Effect)

import Accessibility.Aria
import Components.Icons.Icon as Icon
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Phosphor
import Route exposing (Route)
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr


navBarStyle : List (Html.Attribute msg)
navBarStyle =
    [ Attribute.style "color" "dimgray"
    , Attribute.style "background-color" "white"
    , Attribute.style "padding" ".5rem"
    , Attribute.style "display" "flex"
    , Attribute.style "align-items" "center"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "flex-wrap" "wrap"
    ]
        ++ gradientColorEffect


gradientColorEffect : List (Html.Attribute msg)
gradientColorEffect =
    [ Attribute.style "background" "linear-gradient(90deg, rgb(255, 95, 109) 0%, rgb(255, 195, 113) 100%)"
    , Attribute.style "background-clip" "text"
    , Attribute.style "color" "transparent"
    , Attribute.style "filter" "url(#hue-rotate)"
    ]


svgHueRotateFilter : Html msg
svgHueRotateFilter =
    svg
        [ SvgAttr.viewBox "0 0 800 500"
        , SvgAttr.preserveAspectRatio "none"
        , SvgAttr.width "0"
        , SvgAttr.id "blobSvg"
        ]
        [ Svg.defs []
            [ Svg.filter
                [ SvgAttr.id "hue-rotate"
                ]
                [ Svg.feColorMatrix
                    [ SvgAttr.type_ "hueRotate"
                    , SvgAttr.values "0"
                    ]
                    [ Svg.animate
                        [ SvgAttr.attributeName "values"
                        , SvgAttr.dur "20s"
                        , SvgAttr.from "0"
                        , SvgAttr.to "360"
                        , SvgAttr.repeatCount "indefinite"
                        ]
                        []
                    ]
                ]
            , Svg.linearGradient
                [ SvgAttr.id "gradient"
                , SvgAttr.x1 "0%"
                , SvgAttr.y1 "0%"
                , SvgAttr.x2 "0%"
                , SvgAttr.y2 "100%"
                ]
                [ Svg.stop
                    [ SvgAttr.offset "0%"
                    , SvgAttr.stopColor "rgb(255, 95, 109)"
                    ]
                    []
                , Svg.stop
                    [ SvgAttr.offset "100%"
                    , SvgAttr.stopColor "rgb(255, 195, 113)"
                    ]
                    []
                ]
            ]
        ]


whiteLinksStyle : List (Html.Attribute msg)
whiteLinksStyle =
    [ Attribute.style "text-decoration" "none"
    , Attribute.style "color" "inherit"
    ]


antonFontAttributeStyle : List (Html.Attribute msg)
antonFontAttributeStyle =
    [ Attribute.style "font-family" "'Anton', sans-serif"
    , Attribute.style "font-weight" "400"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "2rem"
    , Attribute.style "line-height" "2rem"
    , Attribute.style "word-break" "break-word"
    ]


workSansAttributeStyle : List (Html.Attribute msg)
workSansAttributeStyle =
    [ Attribute.style "font-family" "'Work Sans', sans-serif"
    , Attribute.style "font-optical-sizing" "auto"
    , Attribute.style "font-weight" "600"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "1rem"
    , Attribute.style "line-height" "1.5"
    ]


siteTitle : List (Html.Attribute msg) -> Html msg
siteTitle style =
    Html.h1
        ([ Attribute.style "margin" "0"
         , Attribute.style "display" "inline-block"
         ]
            ++ gradientColorEffect
            ++ style
        )
        [ Route.Index
            |> Route.link
                (whiteLinksStyle
                    ++ [ Attribute.style "display" "flex"
                       , Attribute.style "align-items" "center"
                       , Attribute.style "gap" "1rem"
                       ]
                )
                [ Icon.light
                    Phosphor.houseLine
                    (Just
                        [ Attribute.style "font-size" "3rem"
                        , Attribute.style "color" "dimgray"
                        , Attribute.style "fill" "url(#gradient)"
                        , Attribute.style "min-width" "3rem"
                        ]
                    )
                , Html.span antonFontAttributeStyle [ Html.text "jmtalarn.com" ]
                ]
        ]


view : { a | showMenu : Bool } -> msg -> Html msg
view model menuClickedMsg =
    Html.header []
        [ Html.nav navBarStyle
            [ siteTitle []
            , Html.div
                (Attribute.style "margin-left" "auto" :: workSansAttributeStyle)
                [ Html.div
                    [ Attribute.style "display" "flex"
                    , Attribute.style "align-items" "center"
                    , Attribute.style "gap" "1rem"
                    ]
                    [ Html.button
                        [ Html.Events.onClick menuClickedMsg
                        , Attribute.style "background" "none"
                        , Attribute.style "border" "none"
                        , Attribute.style "color" "inherit"
                        , Attribute.style "cursor" "pointer"
                        , Attribute.style "display" "flex"
                        , Attribute.style "align-items" "center"
                        , Attribute.style "font-size" "inherit"
                        , Attribute.style "font-weight" "inherit"
                        , Accessibility.Aria.label "Website menu"
                        ]
                        [ Icon.light Phosphor.cards (Just [ Attribute.style "fill" "url(#gradient)" ]) ]
                    , Route.Blog__Page__ { page = Nothing } |> Route.link whiteLinksStyle [ Html.text "Blog" ]
                    ]
                ]
            , svgHueRotateFilter
            ]
        , dialog menuClickedMsg
        ]


dialogId : String
dialogId =
    "menu-dialog"



-- menuStyle : List (Html.Attribute msg)
-- menuStyle =
--     [ Attribute.style "background-color" "white"
--     , Attribute.style "margin" "0"
--     , Attribute.style "right" "0"
--     , Attribute.style "padding" "1rem 2rem"
--     , Attribute.style "background" "linear-gradient(90deg, rgb(255, 95, 109) 0%, rgb(255, 195, 113) 100%)"
--     , Attribute.style "background-clip" "text"
--     , Attribute.style "color" "transparent"
--     , Attribute.style "filter" "url(#hue-rotate)"
--     ]


regularDialogFont : List (Html.Attribute msg)
regularDialogFont =
    [ Attribute.style "font-family" "-apple-system, BlinkMacSystemFont, \"Segoe UI\", Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\""
    , Attribute.style "font-size" "1rem"
    , Attribute.style "max-width" "30rem"
    , Attribute.style "color" "dimGray"
    ]


dialog : msg -> Html msg
dialog menuClickedMsg =
    Html.section []
        [ Html.node "style"
            []
            [ Html.text """
                dialog::backdrop {
                    background: rgba(0,0,0,.40);
                    -webkit-backdrop-filter: blur(2px);
                    backdrop-filter: blur(2px);
                    z-index: 1;
                }
        """ ]
        , Html.node "dialog"
            [ Attribute.style "z-index" "2"
            , Attribute.style "position" "fixed"
            , Attribute.style "top" "5%"
            , Attribute.style "width" "90%"
            , Attribute.style "max-width" "840px"
            , Attribute.style "height" "70%"
            , Attribute.style "box-shadow" "0 0 15px rgba(0,0,0,.9)"
            , Attribute.style "border-radius" "15px"
            , Attribute.style "border" "none"
            , Attribute.id dialogId
            ]
            [ Html.ul
                (gradientColorEffect
                    ++ [ Attribute.style "margin" "0 auto"
                       , Attribute.style "padding" "0"
                       , Attribute.style "max-width" "35rem"
                       ]
                )
                [ Html.li []
                    [ siteTitle [ Html.Events.onClick menuClickedMsg ]
                    , Html.p regularDialogFont [ Html.text "The site home index page." ]
                    ]
                , Html.li [ Attribute.style "font-size" "2rem", Attribute.style "margin-top" "3rem" ]
                    [ Route.Blog__Page__ { page = Nothing }
                        |> Route.link (Html.Events.onClick menuClickedMsg :: whiteLinksStyle) [ Html.text "Web dev notes" ]
                    , Html.p regularDialogFont [ Html.text "Web Dev Notes: Where I jot down tech insights, resources on technology and web development and handy tips to remember." ]
                    ]
                , Html.li [ Attribute.style "font-size" "2rem", Attribute.style "margin-top" "3rem" ]
                    [ Route.Cv
                        |> Route.link (Html.Events.onClick menuClickedMsg :: whiteLinksStyle) [ Html.text "CV" ]
                    , Html.p regularDialogFont [ Html.text "Explore my CV to learn about my background, experience, education, certifications, and projects." ]
                    ]
                , Html.li [ Attribute.style "font-size" "2rem", Attribute.style "margin-top" "3rem" ]
                    [ Route.Book
                        |> Route.link (Html.Events.onClick menuClickedMsg :: whiteLinksStyle) [ Html.text "Book" ]
                    , Html.p regularDialogFont [ Html.text "Review 'Fundamentos Web' on Amazon – your go-to guide for mastering the essentials of web development." ]
                    ]
                ]
            , Html.button
                [ Attribute.style "background" "none"
                , Attribute.style "color" "inherit"
                , Attribute.style "border" "none"
                , Attribute.style "padding" "0"
                , Attribute.style "font" "inherit"
                , Attribute.style "cursor" "pointer"
                , Attribute.style "outline" "inherit"
                , Attribute.style "position" "absolute"
                , Attribute.style "top" "1rem"
                , Attribute.style "right" "1rem"
                , Accessibility.Aria.label "Close the website menu"
                , Html.Events.onClick menuClickedMsg
                ]
                [ Icon.duotone
                    Phosphor.xSquare
                    (Just
                        [ Attribute.style "color" "salmon"
                        , Attribute.style "font-size" "2rem"
                        ]
                    )
                ]
            , svgHueRotateFilter
            ]
        ]



-- |> Html.map toMsg
