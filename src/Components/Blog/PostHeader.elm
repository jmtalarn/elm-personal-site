module Components.Blog.PostHeader exposing (..)

import Components.Icon as Icon
import Date exposing (Date)
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor


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
    let
        tagsContainerStyle =
            [ Attribute.style "display" "flex"
            , Attribute.style "aling-items" "center"
            , Attribute.style "gap" ".4rem"
            ]
    in
    Html.header (headerStyle cover)
        [ Html.h1
            [ Attribute.style "line-height" "2rem" ]
            [ Html.text title
            ]
        , Html.div
            headerTagsStyle
            [ Html.div
                []
                [ Html.div tagsContainerStyle
                    [ Icon.light Phosphor.tag (Just [ Attribute.style "filter" " drop-shadow(1px 2px black)" ])
                    , Html.text (String.join ", " tags)
                    ]
                , Html.div tagsContainerStyle
                    [ Icon.light Phosphor.folderOpen (Just [ Attribute.style "filter" " drop-shadow(1px 2px black)" ])
                    , Html.text (String.join ", " category)
                    ]
                ]
            , Html.div
                tagsContainerStyle
                [ Icon.light Phosphor.calendar (Just [ Attribute.style "filter" " drop-shadow(1px 2px black)" ])
                , Html.text (Date.format "d, MMMM y" date)
                ]
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
