module Gen.Components.Footer exposing (call_, footer, footerStyle, moduleName_, values_)

{-| 
@docs moduleName_, footer, footerStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Footer" ]


{-| footer: Time.Posix -> Html.Html msg -}
footer : Elm.Expression -> Elm.Expression
footer footerArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "footer"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Time" ] "Posix" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ footerArg ]


{-| footerStyle: List (Html.Attribute msg) -}
footerStyle : Elm.Expression
footerStyle =
    Elm.value
        { importFrom = [ "Components", "Footer" ]
        , name = "footerStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


call_ : { footer : Elm.Expression -> Elm.Expression }
call_ =
    { footer =
        \footerArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Footer" ]
                    , name = "footer"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Time" ] "Posix" [] ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ footerArg ]
    }


values_ : { footer : Elm.Expression, footerStyle : Elm.Expression }
values_ =
    { footer =
        Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "footer"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Time" ] "Posix" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , footerStyle =
        Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "footerStyle"
            , annotation =
                Just
                    (Type.list
                        (Type.namedWith
                            [ "Html" ]
                            "Attribute"
                            [ Type.var "msg" ]
                        )
                    )
            }
    }