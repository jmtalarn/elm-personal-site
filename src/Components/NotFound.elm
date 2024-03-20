module Components.NotFound exposing (..)

import Components.Icon as Icon
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor
import Route


body : List (Html msg)
body =
    let
        iconStyle =
            Just [ Attribute.style "font-size" "6rem", Attribute.style "fill" "crimson", Attribute.style "filter" " drop-shadow(1px 2px black)" ]
    in
    [ Html.main_
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "column"
        , Attribute.style "align-items" "center"
        ]
        [ Html.h1 [] [ Html.text "404! Page not found" ]
        , Html.p []
            [ Icon.duotone Phosphor.linkBreak iconStyle
            , Icon.duotone Phosphor.cloudWarning iconStyle
            , Icon.duotone Phosphor.fileX iconStyle
            ]
        , Html.p []
            [ Html.text <| "The page with the given URL doesn't exist and cannot be found right now. From this point I suggest one of these two possible solutions"
            ]
        , Html.ol []
            [ Html.li []
                [ Html.text "Try to write another path in the URL on the browser address" ]
            , Html.li []
                [ Html.text "Try one of these links. I would guess I had content in there"
                , Html.ul []
                    [ Html.li []
                        [ Route.Blog__Page__ { page = Nothing }
                            |> Route.link [] [ Html.text "Web dev notes" ]
                        ]
                    , Html.li []
                        [ Route.Cv
                            |> Route.link [] [ Html.text "CV" ]
                        ]
                    ]
                ]
            ]
        ]
    ]
