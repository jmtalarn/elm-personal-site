module Gen.Route.NotFound exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "NotFound" ]


{-| route: RouteBuilder.StatelessRoute Route.NotFound.RouteParams Route.NotFound.Data Route.NotFound.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "NotFound" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith [ "Route", "NotFound" ] "RouteParams" []
                    , Type.namedWith [ "Route", "NotFound" ] "Data" []
                    , Type.namedWith [ "Route", "NotFound" ] "ActionData" []
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
            (Type.record [ ( "message", Type.string ) ])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { message : Elm.Expression } -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "NotFound" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "NotFound" ]
                    "Data"
                    []
                    (Type.record [ ( "message", Type.string ) ])
                )
                (Elm.record [ Tuple.pair "message" data_args.message ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias [ "Route", "NotFound" ] "Model" [] (Type.record []))
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "NotFound" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "NotFound" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Route", "NotFound" ] "Data" []
                        , Type.namedWith [ "Route", "NotFound" ] "ActionData" []
                        ]
                    )
            }
    }