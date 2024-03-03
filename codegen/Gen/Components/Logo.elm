module Gen.Components.Logo exposing (annotation_, bird, call_, camel, cat, child, heart, house, isMoving, logo, make_, modelHeart, modelStart, moduleName_, perturb, setPattern, step, values_, view)

{-| 
@docs moduleName_, camel, cat, house, child, bird, heart, logo, isMoving, perturb, step, setPattern, view, modelHeart, modelStart, annotation_, make_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Logo" ]


{-| camel: Components.Logo.Pattern -}
camel : Elm.Expression
camel =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "camel"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| cat: Components.Logo.Pattern -}
cat : Elm.Expression
cat =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "cat"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| house: Components.Logo.Pattern -}
house : Elm.Expression
house =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "house"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| child: Components.Logo.Pattern -}
child : Elm.Expression
child =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "child"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| bird: Components.Logo.Pattern -}
bird : Elm.Expression
bird =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "bird"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| heart: Components.Logo.Pattern -}
heart : Elm.Expression
heart =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "heart"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| logo: Components.Logo.Pattern -}
logo : Elm.Expression
logo =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "logo"
        , annotation =
            Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
        }


{-| isMoving: Components.Logo.Model -> Bool -}
isMoving : Elm.Expression -> Elm.Expression
isMoving isMovingArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "isMoving"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Components", "Logo" ] "Model" [] ]
                        Type.bool
                    )
            }
        )
        [ isMovingArg ]


{-| perturb: 
    Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Components.Logo.Model
    -> Components.Logo.Model
-}
perturb :
    Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Elm.Expression
    -> Elm.Expression
perturb perturbArg perturbArg0 perturbArg1 perturbArg2 perturbArg3 perturbArg4 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "perturb"
            , annotation =
                Just
                    (Type.function
                        [ Type.float
                        , Type.float
                        , Type.float
                        , Type.float
                        , Type.float
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Components", "Logo" ] "Model" [])
                    )
            }
        )
        [ Elm.float perturbArg
        , Elm.float perturbArg0
        , Elm.float perturbArg1
        , Elm.float perturbArg2
        , Elm.float perturbArg3
        , perturbArg4
        ]


{-| step: Float -> Components.Logo.Model -> Components.Logo.Model -}
step : Float -> Elm.Expression -> Elm.Expression
step stepArg stepArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "step"
            , annotation =
                Just
                    (Type.function
                        [ Type.float
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Components", "Logo" ] "Model" [])
                    )
            }
        )
        [ Elm.float stepArg, stepArg0 ]


{-| setPattern: Components.Logo.Pattern -> Components.Logo.Model -> Components.Logo.Model -}
setPattern : Elm.Expression -> Elm.Expression -> Elm.Expression
setPattern setPatternArg setPatternArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "setPattern"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Components", "Logo" ] "Pattern" []
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Components", "Logo" ] "Model" [])
                    )
            }
        )
        [ setPatternArg, setPatternArg0 ]


{-| view: List (Html.Attribute msg) -> Components.Logo.Model -> Html.Html msg -}
view : List Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list viewArg, viewArg0 ]


{-| modelHeart: Components.Logo.Model -}
modelHeart : Elm.Expression
modelHeart =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "modelHeart"
        , annotation = Just (Type.namedWith [ "Components", "Logo" ] "Model" [])
        }


{-| modelStart: Components.Logo.Model -}
modelStart : Elm.Expression
modelStart =
    Elm.value
        { importFrom = [ "Components", "Logo" ]
        , name = "modelStart"
        , annotation = Just (Type.namedWith [ "Components", "Logo" ] "Model" [])
        }


annotation_ : { pattern : Type.Annotation, model : Type.Annotation }
annotation_ =
    { pattern =
        Type.alias
            moduleName_
            "Pattern"
            []
            (Type.record
                [ ( "tb1", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                , ( "tb2", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                , ( "tm", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                , ( "sqr", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                , ( "par", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                , ( "ts1", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                , ( "ts2", Type.namedWith [ "Components", "Logo" ] "Target" [] )
                ]
            )
    , model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.record
                [ ( "tb1", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                , ( "tb2", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                , ( "tm", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                , ( "sqr", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                , ( "par", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                , ( "ts1", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                , ( "ts2", Type.namedWith [ "Components", "Logo" ] "Shape" [] )
                ]
            )
    }


make_ :
    { pattern :
        { tb1 : Elm.Expression
        , tb2 : Elm.Expression
        , tm : Elm.Expression
        , sqr : Elm.Expression
        , par : Elm.Expression
        , ts1 : Elm.Expression
        , ts2 : Elm.Expression
        }
        -> Elm.Expression
    , model :
        { tb1 : Elm.Expression
        , tb2 : Elm.Expression
        , tm : Elm.Expression
        , sqr : Elm.Expression
        , par : Elm.Expression
        , ts1 : Elm.Expression
        , ts2 : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { pattern =
        \pattern_args ->
            Elm.withType
                (Type.alias
                    [ "Components", "Logo" ]
                    "Pattern"
                    []
                    (Type.record
                        [ ( "tb1"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        , ( "tb2"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        , ( "tm"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        , ( "sqr"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        , ( "par"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        , ( "ts1"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        , ( "ts2"
                          , Type.namedWith [ "Components", "Logo" ] "Target" []
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "tb1" pattern_args.tb1
                    , Tuple.pair "tb2" pattern_args.tb2
                    , Tuple.pair "tm" pattern_args.tm
                    , Tuple.pair "sqr" pattern_args.sqr
                    , Tuple.pair "par" pattern_args.par
                    , Tuple.pair "ts1" pattern_args.ts1
                    , Tuple.pair "ts2" pattern_args.ts2
                    ]
                )
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Components", "Logo" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "tb1"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        , ( "tb2"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        , ( "tm"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        , ( "sqr"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        , ( "par"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        , ( "ts1"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        , ( "ts2"
                          , Type.namedWith [ "Components", "Logo" ] "Shape" []
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "tb1" model_args.tb1
                    , Tuple.pair "tb2" model_args.tb2
                    , Tuple.pair "tm" model_args.tm
                    , Tuple.pair "sqr" model_args.sqr
                    , Tuple.pair "par" model_args.par
                    , Tuple.pair "ts1" model_args.ts1
                    , Tuple.pair "ts2" model_args.ts2
                    ]
                )
    }


call_ :
    { isMoving : Elm.Expression -> Elm.Expression
    , perturb :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , step : Elm.Expression -> Elm.Expression -> Elm.Expression
    , setPattern : Elm.Expression -> Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { isMoving =
        \isMovingArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Logo" ]
                    , name = "isMoving"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                ]
                                Type.bool
                            )
                    }
                )
                [ isMovingArg ]
    , perturb =
        \perturbArg perturbArg0 perturbArg1 perturbArg2 perturbArg3 perturbArg4 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Logo" ]
                    , name = "perturb"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.float
                                , Type.float
                                , Type.float
                                , Type.float
                                , Type.float
                                , Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                ]
                                (Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                )
                            )
                    }
                )
                [ perturbArg
                , perturbArg0
                , perturbArg1
                , perturbArg2
                , perturbArg3
                , perturbArg4
                ]
    , step =
        \stepArg stepArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Logo" ]
                    , name = "step"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.float
                                , Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                ]
                                (Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                )
                            )
                    }
                )
                [ stepArg, stepArg0 ]
    , setPattern =
        \setPatternArg setPatternArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Logo" ]
                    , name = "setPattern"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Pattern"
                                    []
                                , Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                ]
                                (Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                )
                            )
                    }
                )
                [ setPatternArg, setPatternArg0 ]
    , view =
        \viewArg viewArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Logo" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Components", "Logo" ]
                                    "Model"
                                    []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    }


values_ :
    { camel : Elm.Expression
    , cat : Elm.Expression
    , house : Elm.Expression
    , child : Elm.Expression
    , bird : Elm.Expression
    , heart : Elm.Expression
    , logo : Elm.Expression
    , isMoving : Elm.Expression
    , perturb : Elm.Expression
    , step : Elm.Expression
    , setPattern : Elm.Expression
    , view : Elm.Expression
    , modelHeart : Elm.Expression
    , modelStart : Elm.Expression
    }
values_ =
    { camel =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "camel"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , cat =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "cat"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , house =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "house"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , child =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "child"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , bird =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "bird"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , heart =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "heart"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , logo =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "logo"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Pattern" [])
            }
    , isMoving =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "isMoving"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Components", "Logo" ] "Model" [] ]
                        Type.bool
                    )
            }
    , perturb =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "perturb"
            , annotation =
                Just
                    (Type.function
                        [ Type.float
                        , Type.float
                        , Type.float
                        , Type.float
                        , Type.float
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Components", "Logo" ] "Model" [])
                    )
            }
    , step =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "step"
            , annotation =
                Just
                    (Type.function
                        [ Type.float
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Components", "Logo" ] "Model" [])
                    )
            }
    , setPattern =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "setPattern"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Components", "Logo" ] "Pattern" []
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Components", "Logo" ] "Model" [])
                    )
            }
    , view =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith [ "Components", "Logo" ] "Model" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , modelHeart =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "modelHeart"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Model" [])
            }
    , modelStart =
        Elm.value
            { importFrom = [ "Components", "Logo" ]
            , name = "modelStart"
            , annotation =
                Just (Type.namedWith [ "Components", "Logo" ] "Model" [])
            }
    }