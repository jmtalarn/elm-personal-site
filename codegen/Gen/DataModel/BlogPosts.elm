module Gen.DataModel.BlogPosts exposing (annotation_, blogPostDecoder, blogPosts, blogPostsGlob, blogPostsToDict, call_, decodeDate, make_, moduleName_, values_)

{-| 
@docs moduleName_, blogPostDecoder, decodeDate, blogPosts, blogPostsToDict, blogPostsGlob, annotation_, make_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "DataModel", "BlogPosts" ]


{-| blogPostDecoder: String -> Json.Decode.Decoder DataModel.BlogPosts.BlogPost -}
blogPostDecoder : String -> Elm.Expression
blogPostDecoder blogPostDecoderArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "blogPostDecoder"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "Json", "Decode" ]
                            "Decoder"
                            [ Type.namedWith
                                [ "DataModel", "BlogPosts" ]
                                "BlogPost"
                                []
                            ]
                        )
                    )
            }
        )
        [ Elm.string blogPostDecoderArg ]


{-| decodeDate: Json.Decode.Decoder Date.Date -}
decodeDate : Elm.Expression
decodeDate =
    Elm.value
        { importFrom = [ "DataModel", "BlogPosts" ]
        , name = "decodeDate"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "Date" ] "Date" [] ]
                )
        }


{-| blogPosts: BackendTask.BackendTask FatalError.FatalError (List DataModel.BlogPosts.BlogPost) -}
blogPosts : Elm.Expression
blogPosts =
    Elm.value
        { importFrom = [ "DataModel", "BlogPosts" ]
        , name = "blogPosts"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.list
                        (Type.namedWith
                            [ "DataModel", "BlogPosts" ]
                            "BlogPost"
                            []
                        )
                    ]
                )
        }


{-| blogPostsToDict: 
    BackendTask.BackendTask FatalError.FatalError (List DataModel.BlogPosts.BlogPost)
    -> BackendTask.BackendTask FatalError.FatalError (Dict.Dict String DataModel.BlogPosts.BlogPost)
-}
blogPostsToDict : Elm.Expression -> Elm.Expression
blogPostsToDict blogPostsToDictArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "blogPostsToDict"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.list
                                (Type.namedWith
                                    [ "DataModel", "BlogPosts" ]
                                    "BlogPost"
                                    []
                                )
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Dict" ]
                                "Dict"
                                [ Type.string
                                , Type.namedWith
                                    [ "DataModel", "BlogPosts" ]
                                    "BlogPost"
                                    []
                                ]
                            ]
                        )
                    )
            }
        )
        [ blogPostsToDictArg ]


{-| blogPostsGlob: BackendTask.BackendTask error (List { fileName : String, filePath : String }) -}
blogPostsGlob : Elm.Expression
blogPostsGlob =
    Elm.value
        { importFrom = [ "DataModel", "BlogPosts" ]
        , name = "blogPostsGlob"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.var "error"
                    , Type.list
                        (Type.record
                            [ ( "fileName", Type.string )
                            , ( "filePath", Type.string )
                            ]
                        )
                    ]
                )
        }


annotation_ : { blogPostList : Type.Annotation, blogPost : Type.Annotation }
annotation_ =
    { blogPostList =
        Type.alias
            moduleName_
            "BlogPostList"
            []
            (Type.list
                (Type.namedWith [ "DataModel", "BlogPosts" ] "BlogPost" [])
            )
    , blogPost =
        Type.alias
            moduleName_
            "BlogPost"
            []
            (Type.record
                [ ( "body", Type.string )
                , ( "slug", Type.string )
                , ( "title", Type.string )
                , ( "cover", Type.string )
                , ( "category", Type.list Type.string )
                , ( "tags", Type.list Type.string )
                , ( "date", Type.namedWith [ "Date" ] "Date" [] )
                ]
            )
    }


make_ :
    { blogPost :
        { body : Elm.Expression
        , slug : Elm.Expression
        , title : Elm.Expression
        , cover : Elm.Expression
        , category : Elm.Expression
        , tags : Elm.Expression
        , date : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { blogPost =
        \blogPost_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "BlogPosts" ]
                    "BlogPost"
                    []
                    (Type.record
                        [ ( "body", Type.string )
                        , ( "slug", Type.string )
                        , ( "title", Type.string )
                        , ( "cover", Type.string )
                        , ( "category", Type.list Type.string )
                        , ( "tags", Type.list Type.string )
                        , ( "date", Type.namedWith [ "Date" ] "Date" [] )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "body" blogPost_args.body
                    , Tuple.pair "slug" blogPost_args.slug
                    , Tuple.pair "title" blogPost_args.title
                    , Tuple.pair "cover" blogPost_args.cover
                    , Tuple.pair "category" blogPost_args.category
                    , Tuple.pair "tags" blogPost_args.tags
                    , Tuple.pair "date" blogPost_args.date
                    ]
                )
    }


call_ :
    { blogPostDecoder : Elm.Expression -> Elm.Expression
    , blogPostsToDict : Elm.Expression -> Elm.Expression
    }
call_ =
    { blogPostDecoder =
        \blogPostDecoderArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "DataModel", "BlogPosts" ]
                    , name = "blogPostDecoder"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    [ "Json", "Decode" ]
                                    "Decoder"
                                    [ Type.namedWith
                                        [ "DataModel", "BlogPosts" ]
                                        "BlogPost"
                                        []
                                    ]
                                )
                            )
                    }
                )
                [ blogPostDecoderArg ]
    , blogPostsToDict =
        \blogPostsToDictArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "DataModel", "BlogPosts" ]
                    , name = "blogPostsToDict"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.list
                                        (Type.namedWith
                                            [ "DataModel", "BlogPosts" ]
                                            "BlogPost"
                                            []
                                        )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.namedWith
                                        [ "Dict" ]
                                        "Dict"
                                        [ Type.string
                                        , Type.namedWith
                                            [ "DataModel", "BlogPosts" ]
                                            "BlogPost"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ blogPostsToDictArg ]
    }


values_ :
    { blogPostDecoder : Elm.Expression
    , decodeDate : Elm.Expression
    , blogPosts : Elm.Expression
    , blogPostsToDict : Elm.Expression
    , blogPostsGlob : Elm.Expression
    }
values_ =
    { blogPostDecoder =
        Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "blogPostDecoder"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "Json", "Decode" ]
                            "Decoder"
                            [ Type.namedWith
                                [ "DataModel", "BlogPosts" ]
                                "BlogPost"
                                []
                            ]
                        )
                    )
            }
    , decodeDate =
        Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "decodeDate"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "Date" ] "Date" [] ]
                    )
            }
    , blogPosts =
        Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "blogPosts"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.list
                            (Type.namedWith
                                [ "DataModel", "BlogPosts" ]
                                "BlogPost"
                                []
                            )
                        ]
                    )
            }
    , blogPostsToDict =
        Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "blogPostsToDict"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.list
                                (Type.namedWith
                                    [ "DataModel", "BlogPosts" ]
                                    "BlogPost"
                                    []
                                )
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Dict" ]
                                "Dict"
                                [ Type.string
                                , Type.namedWith
                                    [ "DataModel", "BlogPosts" ]
                                    "BlogPost"
                                    []
                                ]
                            ]
                        )
                    )
            }
    , blogPostsGlob =
        Elm.value
            { importFrom = [ "DataModel", "BlogPosts" ]
            , name = "blogPostsGlob"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.var "error"
                        , Type.list
                            (Type.record
                                [ ( "fileName", Type.string )
                                , ( "filePath", Type.string )
                                ]
                            )
                        ]
                    )
            }
    }