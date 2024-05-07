module Gen.Route.Blog.Page__ exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Blog", "Page__" ]


{-| route: RouteBuilder.StatelessRoute Route.Blog.Page__.RouteParams Route.Blog.Page__.Data Route.Blog.Page__.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Blog", "Page__" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Blog", "Page__" ]
                        "RouteParams"
                        []
                    , Type.namedWith [ "Route", "Blog", "Page__" ] "Data" []
                    , Type.namedWith
                        [ "Route", "Blog", "Page__" ]
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
            (Type.record
                [ ( "posts"
                  , Type.list
                        (Type.namedWith
                            [ "Route", "Blog", "Page__" ]
                            "BlogPost"
                            []
                        )
                  )
                , ( "page", Type.int )
                , ( "totalPages", Type.int )
                ]
            )
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data :
        { posts : Elm.Expression
        , page : Elm.Expression
        , totalPages : Elm.Expression
        }
        -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Page__" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Page__" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "posts"
                          , Type.list
                                (Type.namedWith
                                    [ "Route", "Blog", "Page__" ]
                                    "BlogPost"
                                    []
                                )
                          )
                        , ( "page", Type.int )
                        , ( "totalPages", Type.int )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "posts" data_args.posts
                    , Tuple.pair "page" data_args.page
                    , Tuple.pair "totalPages" data_args.totalPages
                    ]
                )
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Page__" ]
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
            { importFrom = [ "Route", "Blog", "Page__" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Blog", "Page__" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Route", "Blog", "Page__" ] "Data" []
                        , Type.namedWith
                            [ "Route", "Blog", "Page__" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }