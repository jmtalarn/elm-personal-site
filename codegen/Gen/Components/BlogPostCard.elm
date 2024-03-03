module Gen.Components.BlogPostCard exposing (blogPostCard, blogPostCardContentStyle, blogPostCardStyle, call_, getAbstract, headerImageStyle, moduleName_, values_, whiteLinksStyle)

{-| 
@docs moduleName_, blogPostCard, headerImageStyle, getAbstract, blogPostCardContentStyle, whiteLinksStyle, blogPostCardStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "BlogPostCard" ]


{-| blogPostCard: DataModel.BlogPosts.BlogPost -> Html.Html msg -}
blogPostCard : Elm.Expression -> Elm.Expression
blogPostCard blogPostCardArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "blogPostCard"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "DataModel", "BlogPosts" ]
                            "BlogPost"
                            []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ blogPostCardArg ]


{-| headerImageStyle: List (Html.Attribute msg) -}
headerImageStyle : Elm.Expression
headerImageStyle =
    Elm.value
        { importFrom = [ "Components", "BlogPostCard" ]
        , name = "headerImageStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| getAbstract: String -> String -}
getAbstract : String -> Elm.Expression
getAbstract getAbstractArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "getAbstract"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
        )
        [ Elm.string getAbstractArg ]


{-| blogPostCardContentStyle: List (Html.Attribute msg) -}
blogPostCardContentStyle : Elm.Expression
blogPostCardContentStyle =
    Elm.value
        { importFrom = [ "Components", "BlogPostCard" ]
        , name = "blogPostCardContentStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| whiteLinksStyle: List (Html.Attribute msg) -}
whiteLinksStyle : Elm.Expression
whiteLinksStyle =
    Elm.value
        { importFrom = [ "Components", "BlogPostCard" ]
        , name = "whiteLinksStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| blogPostCardStyle: Html.Html msg -}
blogPostCardStyle : Elm.Expression
blogPostCardStyle =
    Elm.value
        { importFrom = [ "Components", "BlogPostCard" ]
        , name = "blogPostCardStyle"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


call_ :
    { blogPostCard : Elm.Expression -> Elm.Expression
    , getAbstract : Elm.Expression -> Elm.Expression
    }
call_ =
    { blogPostCard =
        \blogPostCardArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "BlogPostCard" ]
                    , name = "blogPostCard"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "DataModel", "BlogPosts" ]
                                    "BlogPost"
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
                [ blogPostCardArg ]
    , getAbstract =
        \getAbstractArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "BlogPostCard" ]
                    , name = "getAbstract"
                    , annotation =
                        Just (Type.function [ Type.string ] Type.string)
                    }
                )
                [ getAbstractArg ]
    }


values_ :
    { blogPostCard : Elm.Expression
    , headerImageStyle : Elm.Expression
    , getAbstract : Elm.Expression
    , blogPostCardContentStyle : Elm.Expression
    , whiteLinksStyle : Elm.Expression
    , blogPostCardStyle : Elm.Expression
    }
values_ =
    { blogPostCard =
        Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "blogPostCard"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "DataModel", "BlogPosts" ]
                            "BlogPost"
                            []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , headerImageStyle =
        Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "headerImageStyle"
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
    , getAbstract =
        Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "getAbstract"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , blogPostCardContentStyle =
        Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "blogPostCardContentStyle"
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
    , whiteLinksStyle =
        Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "whiteLinksStyle"
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
    , blogPostCardStyle =
        Elm.value
            { importFrom = [ "Components", "BlogPostCard" ]
            , name = "blogPostCardStyle"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    }