module Components.PostHeader exposing (..)

import Date exposing (Date)
import Html exposing (Html)
import Html.Attributes as Attribute


headerTagsStyle : List (Html.Attribute msg)
headerTagsStyle =
    [ Attribute.style "display" "flex"
    , Attribute.style "align-items" "self-end"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "font-size" "0.8rem"

    -- , Attribute.style "padding" "0 1rem"
    ]


show : String -> String -> List String -> List String -> Date -> Html msg
show title cover tags category date =
    Html.header (headerStyle cover)
        [ Html.h1
            [ Attribute.style "line-height" "2rem" ]
            [ Html.text title
            ]
        , Html.div
            headerTagsStyle
            [ Html.div
                []
                [ Html.div [] [ Html.text ("🔖 " ++ String.join ", " tags) ]
                , Html.div [] [ Html.text ("📂 " ++ String.join ", " category) ]
                ]
            , Html.div [] [ Html.text ("📅 " ++ Date.format "d, MMMM y" date) ]
            ]
        ]



--ShowDate


headerStyle : String -> List (Html.Attribute msg)
headerStyle cover =
    let
        _ =
            Debug.log "cover" cover
    in
    [ Attribute.style "min-height" "200px"
    , Attribute.style "display" "flex"
    , Attribute.style "flex-direction" "column"
    , Attribute.style "padding" "0rem 1rem 1rem 1rem"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "color" "white"
    , Attribute.style "text-shadow" "2px 2px 2px black"
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
