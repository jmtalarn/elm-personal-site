module Gen.Route.Cv exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Cv" ]


{-| route: RouteBuilder.StatefulRoute Route.Cv.RouteParams Route.Cv.Data Route.Cv.ActionData Route.Cv.Model Route.Cv.Msg -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Cv" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatefulRoute"
                    [ Type.namedWith [ "Route", "Cv" ] "RouteParams" []
                    , Type.namedWith [ "Route", "Cv" ] "Data" []
                    , Type.namedWith [ "Route", "Cv" ] "ActionData" []
                    , Type.namedWith [ "Route", "Cv" ] "Model" []
                    , Type.namedWith [ "Route", "Cv" ] "Msg" []
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
                [ ( "selectedSkills", Type.list Type.string )
                , ( "show", Type.namedWith [ "Route", "Cv" ] "ShowSections" [] )
                ]
            )
    , msg = Type.namedWith [ "Route", "Cv" ] "Msg" []
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { cv : Elm.Expression } -> Elm.Expression
    , model :
        { selectedSkills : Elm.Expression, show : Elm.Expression }
        -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias [ "Route", "Cv" ] "ActionData" [] (Type.record []))
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Cv" ]
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
                    [ "Route", "Cv" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "selectedSkills", Type.list Type.string )
                        , ( "show"
                          , Type.namedWith [ "Route", "Cv" ] "ShowSections" []
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "selectedSkills" model_args.selectedSkills
                    , Tuple.pair "show" model_args.show
                    ]
                )
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Cv" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatefulRoute"
                        [ Type.namedWith [ "Route", "Cv" ] "RouteParams" []
                        , Type.namedWith [ "Route", "Cv" ] "Data" []
                        , Type.namedWith [ "Route", "Cv" ] "ActionData" []
                        , Type.namedWith [ "Route", "Cv" ] "Model" []
                        , Type.namedWith [ "Route", "Cv" ] "Msg" []
                        ]
                    )
            }
    }