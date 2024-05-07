module Gen.Route.Index exposing (annotation_, call_, make_, moduleName_, route, values_, view)

{-| 
@docs moduleName_, view, route, annotation_, make_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Index" ]


{-| view: 
    RouteBuilder.App Route.Index.Data Route.Index.ActionData Route.Index.RouteParams
    -> Shared.Model
    -> Route.Index.Model
    -> View.View (PagesMsg.PagesMsg Route.Index.Msg)
-}
view : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 viewArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Index" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith [ "Route", "Index" ] "Data" []
                            , Type.namedWith
                                [ "Route", "Index" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Index" ]
                                "RouteParams"
                                []
                            ]
                        , Type.namedWith [ "Shared" ] "Model" []
                        , Type.namedWith [ "Route", "Index" ] "Model" []
                        ]
                        (Type.namedWith
                            [ "View" ]
                            "View"
                            [ Type.namedWith
                                [ "PagesMsg" ]
                                "PagesMsg"
                                [ Type.namedWith [ "Route", "Index" ] "Msg" [] ]
                            ]
                        )
                    )
            }
        )
        [ viewArg, viewArg0, viewArg1 ]


{-| route: RouteBuilder.StatefulRoute Route.Index.RouteParams Route.Index.Data Route.Index.ActionData Route.Index.Model Route.Index.Msg -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Index" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatefulRoute"
                    [ Type.namedWith [ "Route", "Index" ] "RouteParams" []
                    , Type.namedWith [ "Route", "Index" ] "Data" []
                    , Type.namedWith [ "Route", "Index" ] "ActionData" []
                    , Type.namedWith [ "Route", "Index" ] "Model" []
                    , Type.namedWith [ "Route", "Index" ] "Msg" []
                    ]
                )
        }


annotation_ :
    { actionData : Type.Annotation
    , data : Type.Annotation
    , model : Type.Annotation
    , msg : Type.Annotation
    }
annotation_ =
    { actionData = Type.alias moduleName_ "ActionData" [] (Type.record [])
    , data =
        Type.alias
            moduleName_
            "Data"
            []
            (Type.record
                [ ( "cv", Type.namedWith [ "DataModel", "CV" ] "CV" [] ) ]
            )
    , model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.record
                [ ( "state"
                  , Type.namedWith
                        [ "Animator" ]
                        "Timeline"
                        [ Type.namedWith [ "Route", "Index" ] "State" [] ]
                  )
                , ( "tickCount", Type.int )
                ]
            )
    , msg = Type.namedWith [ "Route", "Index" ] "Msg" []
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { cv : Elm.Expression } -> Elm.Expression
    , model :
        { state : Elm.Expression, tickCount : Elm.Expression } -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Index" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Index" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "cv", Type.namedWith [ "DataModel", "CV" ] "CV" [] )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "cv" data_args.cv ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Index" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "state"
                          , Type.namedWith
                                [ "Animator" ]
                                "Timeline"
                                [ Type.namedWith [ "Route", "Index" ] "State" []
                                ]
                          )
                        , ( "tickCount", Type.int )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "state" model_args.state
                    , Tuple.pair "tickCount" model_args.tickCount
                    ]
                )
    }


call_ :
    { view :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg viewArg0 viewArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Index" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Index" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Index" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Index" ]
                                        "RouteParams"
                                        []
                                    ]
                                , Type.namedWith [ "Shared" ] "Model" []
                                , Type.namedWith [ "Route", "Index" ] "Model" []
                                ]
                                (Type.namedWith
                                    [ "View" ]
                                    "View"
                                    [ Type.namedWith
                                        [ "PagesMsg" ]
                                        "PagesMsg"
                                        [ Type.namedWith
                                            [ "Route", "Index" ]
                                            "Msg"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0, viewArg1 ]
    }


values_ : { view : Elm.Expression, route : Elm.Expression }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Route", "Index" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith [ "Route", "Index" ] "Data" []
                            , Type.namedWith
                                [ "Route", "Index" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Index" ]
                                "RouteParams"
                                []
                            ]
                        , Type.namedWith [ "Shared" ] "Model" []
                        , Type.namedWith [ "Route", "Index" ] "Model" []
                        ]
                        (Type.namedWith
                            [ "View" ]
                            "View"
                            [ Type.namedWith
                                [ "PagesMsg" ]
                                "PagesMsg"
                                [ Type.namedWith [ "Route", "Index" ] "Msg" [] ]
                            ]
                        )
                    )
            }
    , route =
        Elm.value
            { importFrom = [ "Route", "Index" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatefulRoute"
                        [ Type.namedWith [ "Route", "Index" ] "RouteParams" []
                        , Type.namedWith [ "Route", "Index" ] "Data" []
                        , Type.namedWith [ "Route", "Index" ] "ActionData" []
                        , Type.namedWith [ "Route", "Index" ] "Model" []
                        , Type.namedWith [ "Route", "Index" ] "Msg" []
                        ]
                    )
            }
    }