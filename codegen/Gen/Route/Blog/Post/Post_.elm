module Gen.Route.Blog.Post.Post_ exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Blog", "Post", "Post_" ]


{-| route: RouteBuilder.StatelessRoute Route.Blog.Post.Post_.RouteParams Route.Blog.Post.Post_.Data Route.Blog.Post.Post_.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Blog", "Post", "Post_" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Blog", "Post", "Post_" ]
                        "RouteParams"
                        []
                    , Type.namedWith
                        [ "Route", "Blog", "Post", "Post_" ]
                        "Data"
                        []
                    , Type.namedWith
                        [ "Route", "Blog", "Post", "Post_" ]
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
                [ ( "blogPost"
                  , Type.namedWith
                        [ "Route", "Blog", "Post", "Post_" ]
                        "BlogPost"
                        []
                  )
                ]
            )
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { blogPost : Elm.Expression } -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Post", "Post_" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Post", "Post_" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "blogPost"
                          , Type.namedWith
                                [ "Route", "Blog", "Post", "Post_" ]
                                "BlogPost"
                                []
                          )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "blogPost" data_args.blogPost ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Post", "Post_" ]
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
            { importFrom = [ "Route", "Blog", "Post", "Post_" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Blog", "Post", "Post_" ]
                            "RouteParams"
                            []
                        , Type.namedWith
                            [ "Route", "Blog", "Post", "Post_" ]
                            "Data"
                            []
                        , Type.namedWith
                            [ "Route", "Blog", "Post", "Post_" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }