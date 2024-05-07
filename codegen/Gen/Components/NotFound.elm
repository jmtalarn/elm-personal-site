module Gen.Components.NotFound exposing (body, moduleName_, values_)

{-| 
@docs moduleName_, body, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "NotFound" ]


{-| body: List (Html.Html msg) -}
body : Elm.Expression
body =
    Elm.value
        { importFrom = [ "Components", "NotFound" ]
        , name = "body"
        , annotation =
            Just
                (Type.list (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                )
        }


values_ : { body : Elm.Expression }
values_ =
    { body =
        Elm.value
            { importFrom = [ "Components", "NotFound" ]
            , name = "body"
            , annotation =
                Just
                    (Type.list
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }