module Components.PostHeader exposing (..)

import Html exposing (Html)
import Html.Attributes as Attribute


show : String -> String -> List String -> List String -> Html msg
show title cover tags category =
    Html.header (headerStyle cover)
        [ Html.h1
            []
            [ Html.text title
            ]
        ]


headerStyle : String -> List (Html.Attribute msg)
headerStyle cover =
    let
        _ =
            Debug.log "cover" cover
    in
    [ Attribute.style "width"
        "100%"
    , Attribute.style
        "min-height"
        "200px"
    , Attribute.style "color" "white"
    , Attribute.style
        "background-image"
        ("url(\""
            ++ cover
            ++ "\")"
        )
    , Attribute.style "background-repeat" "no-repeat"
    , Attribute.style "background-position" "center"
    , Attribute.style "background-size" "cover"
    ]
