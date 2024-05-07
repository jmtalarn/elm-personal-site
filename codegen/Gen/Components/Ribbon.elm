module Gen.Components.Ribbon exposing (call_, moduleName_, ribbon, ribbonReverse, values_)

{-| 
@docs moduleName_, ribbon, ribbonReverse, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Ribbon" ]


{-| ribbon: String -> Html.Html msg -}
ribbon : String -> Elm.Expression
ribbon ribbonArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Ribbon" ]
            , name = "ribbon"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string ribbonArg ]


{-| ribbonReverse: String -> Html.Html msg -}
ribbonReverse : String -> Elm.Expression
ribbonReverse ribbonReverseArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Ribbon" ]
            , name = "ribbonReverse"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string ribbonReverseArg ]


call_ :
    { ribbon : Elm.Expression -> Elm.Expression
    , ribbonReverse : Elm.Expression -> Elm.Expression
    }
call_ =
    { ribbon =
        \ribbonArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Ribbon" ]
                    , name = "ribbon"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ ribbonArg ]
    , ribbonReverse =
        \ribbonReverseArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Ribbon" ]
                    , name = "ribbonReverse"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ ribbonReverseArg ]
    }


values_ : { ribbon : Elm.Expression, ribbonReverse : Elm.Expression }
values_ =
    { ribbon =
        Elm.value
            { importFrom = [ "Components", "Ribbon" ]
            , name = "ribbon"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , ribbonReverse =
        Elm.value
            { importFrom = [ "Components", "Ribbon" ]
            , name = "ribbonReverse"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }