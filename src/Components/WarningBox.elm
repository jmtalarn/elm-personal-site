module Components.WarningBox exposing (..)

import Components.Icon as Icon
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor


warningBox : List (Html msg) -> Html msg
warningBox children =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "align-items" "center"
        , Attribute.style "gap" "1rem"
        , Attribute.style "padding" "1rem"
        , Attribute.style "background-color" "lightyellow"
        , Attribute.style "font-weight" "100"
        , Attribute.style "border-radius" "10px"
        , Attribute.style "border-left" "10px solid orange"
        ]
        [ Html.span
            [ Attribute.style "color" "orange"
            , Attribute.style "text-shadow" "1px 0px gray"
            , Attribute.style "font-size" "2rem"
            ]
            [ Icon.duotone
                Phosphor.warningDiamond
                (Just [ Attribute.style "font-size" "3rem" ])
            ]
        , Html.div [ Attribute.style "line-height" "1.3rem" ] children
        ]
