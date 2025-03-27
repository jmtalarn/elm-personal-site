module Components.Icons.TechIcon exposing (..)

import Components.Icons.Home as HomeIcon
import Dict
import Html exposing (Html)
import Util.HTMLRender exposing (processStyleAttribute)


icon : String -> Maybe String -> List (Html msg) -> Html msg
icon i style _ =
    let
        styleAttributes =
            processStyleAttribute (Maybe.withDefault "" style)

        dict =
            Dict.fromList
                [ ( "js", HomeIcon.javascript styleAttributes )
                , ( "elm", HomeIcon.elm styleAttributes )
                , ( "ts", HomeIcon.typescript styleAttributes )
                ]
    in
    Maybe.withDefault (Html.text "") <| Dict.get i dict
