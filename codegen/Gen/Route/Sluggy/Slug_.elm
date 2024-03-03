module Gen.Route.Sluggy.Slug_ exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Sluggy", "Slug_" ]


{-| route: RouteBuilder.StatelessRoute Route.Sluggy.Slug_.RouteParams Route.Sluggy.Slug_.Data Route.Sluggy.Slug_.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Sluggy", "Slug_" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Sluggy", "Slug_" ]
                        "RouteParams"
                        []
                    , Type.namedWith [ "Route", "Sluggy", "Slug_" ] "Data" []
                    , Type.namedWith
                        [ "Route", "Sluggy", "Slug_" ]
                        "ActionData"
                        []
                    ]
                )
        }


annotation_ :
    { actionData : Type.Annotation
    , data : Type.Annotation
    , msg : Type.Annotation
    , model : Type.Annotation
    }
annotation_ =
    { actionData = Type.alias moduleName_ "ActionData" [] (Type.record [])
    , data =
        Type.alias
            moduleName_
            "Data"
            []
            (Type.record [ ( "something", Type.string ) ])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { something : Elm.Expression } -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Sluggy", "Slug_" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Sluggy", "Slug_" ]
                    "Data"
                    []
                    (Type.record [ ( "something", Type.string ) ])
                )
                (Elm.record [ Tuple.pair "something" data_args.something ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Sluggy", "Slug_" ]
                    "Model"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Sluggy", "Slug_" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Sluggy", "Slug_" ]
                            "RouteParams"
                            []
                        , Type.namedWith
                            [ "Route", "Sluggy", "Slug_" ]
                            "Data"
                            []
                        , Type.namedWith
                            [ "Route", "Sluggy", "Slug_" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }