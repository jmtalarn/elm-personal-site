module Gen.Components.Blog.PostCard exposing (blogPostCard, blogPostCardContentStyle, blogPostCardStyle, call_, headerImageStyle, iconSizeStyle, moduleName_, taggedContentStyle, values_, whiteLinksStyle)

{-| 
@docs moduleName_, blogPostCard, iconSizeStyle, headerImageStyle, blogPostCardContentStyle, taggedContentStyle, whiteLinksStyle, blogPostCardStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Blog", "PostCard" ]


{-| blogPostCard: DataModel.BlogPosts.BlogPost -> Html.Html msg -}
blogPostCard : Elm.Expression -> Elm.Expression
blogPostCard blogPostCardArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Blog", "PostCard" ]
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


{-| iconSizeStyle: List (Html.Attribute msg) -}
iconSizeStyle : Elm.Expression
iconSizeStyle =
    Elm.value
        { importFrom = [ "Components", "Blog", "PostCard" ]
        , name = "iconSizeStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| headerImageStyle: List (Html.Attribute msg) -}
headerImageStyle : Elm.Expression
headerImageStyle =
    Elm.value
        { importFrom = [ "Components", "Blog", "PostCard" ]
        , name = "headerImageStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| blogPostCardContentStyle: List (Html.Attribute msg) -}
blogPostCardContentStyle : Elm.Expression
blogPostCardContentStyle =
    Elm.value
        { importFrom = [ "Components", "Blog", "PostCard" ]
        , name = "blogPostCardContentStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| taggedContentStyle: List (Html.Attribute msg) -}
taggedContentStyle : Elm.Expression
taggedContentStyle =
    Elm.value
        { importFrom = [ "Components", "Blog", "PostCard" ]
        , name = "taggedContentStyle"
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
        { importFrom = [ "Components", "Blog", "PostCard" ]
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
        { importFrom = [ "Components", "Blog", "PostCard" ]
        , name = "blogPostCardStyle"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


call_ : { blogPostCard : Elm.Expression -> Elm.Expression }
call_ =
    { blogPostCard =
        \blogPostCardArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Blog", "PostCard" ]
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
    }


values_ :
    { blogPostCard : Elm.Expression
    , iconSizeStyle : Elm.Expression
    , headerImageStyle : Elm.Expression
    , blogPostCardContentStyle : Elm.Expression
    , taggedContentStyle : Elm.Expression
    , whiteLinksStyle : Elm.Expression
    , blogPostCardStyle : Elm.Expression
    }
values_ =
    { blogPostCard =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostCard" ]
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
    , iconSizeStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostCard" ]
            , name = "iconSizeStyle"
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
    , headerImageStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostCard" ]
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
    , blogPostCardContentStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostCard" ]
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
    , taggedContentStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostCard" ]
            , name = "taggedContentStyle"
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
            { importFrom = [ "Components", "Blog", "PostCard" ]
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
            { importFrom = [ "Components", "Blog", "PostCard" ]
            , name = "blogPostCardStyle"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    }