module Components.NavBar exposing (..)

-- import Effect exposing (Effect)

import Components.Icons.Icon as Icon
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Phosphor
import Route exposing (Route)


navBarStyle : List (Html.Attribute msg)
navBarStyle =
    [ Attribute.style "color" "white"
    , Attribute.style "background-color" "dimGray"
    , Attribute.style "padding" ".5rem"
    , Attribute.style "display" "flex"
    , Attribute.style "align-items" "center"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "flex-wrap" "wrap"
    ]


whiteLinksStyle : List (Html.Attribute msg)
whiteLinksStyle =
    [ Attribute.style "text-decoration" "none"
    , Attribute.style "color" "inherit"
    ]


menuStyle : List (Html.Attribute msg)
menuStyle =
    [ Attribute.style "position" "absolute"
    , Attribute.style "background-color" "dimgray"
    , Attribute.style "margin" "0"
    , Attribute.style "right" "0"
    , Attribute.style "padding" "1rem 2rem"
    , Attribute.style "z-index" "1"
    ]


view : { a | showMenu : Bool } -> msg -> Html msg
view model menuClickedMsg =
    Html.nav navBarStyle
        [ Html.h1
            [ Attribute.style "margin" "0"
            ]
            [ Route.Index
                |> Route.link
                    (whiteLinksStyle
                        ++ [ Attribute.style "display" "flex"
                           , Attribute.style "align-items" "center"
                           , Attribute.style "gap" "1rem"
                           ]
                    )
                    [ Icon.light Phosphor.houseLine Nothing
                    , Html.text "jmtalarn.com"
                    ]
            ]
        , Html.div
            [ Attribute.style "margin-left" "auto" ]
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
                    ]
                    ([]
                        ++ (if model.showMenu then
                                [ Html.text "Less things", Icon.light Phosphor.caretUp Nothing ]

                            else
                                [ Html.text "More things", Icon.light Phosphor.caretDown Nothing ]
                           )
                    )
                , Route.Blog__Page__ { page = Nothing } |> Route.link whiteLinksStyle [ Html.text "Blog" ]
                ]
            , if model.showMenu then
                Html.ul menuStyle
                    [ Html.li []
                        [ Route.Blog__Page__ { page = Nothing }
                            |> Route.link (Html.Events.onClick menuClickedMsg :: whiteLinksStyle) [ Html.text "Web dev notes" ]
                        ]
                    , Html.li []
                        [ Route.Cv
                            |> Route.link (Html.Events.onClick menuClickedMsg :: whiteLinksStyle) [ Html.text "CV" ]
                        ]
                    ]

              else
                Html.text ""
            ]
        ]



-- |> Html.map toMsg
