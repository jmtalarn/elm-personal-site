module Gen.Components.Blog.PostHeader exposing (call_, headerStyle, headerTagsStyle, moduleName_, show, values_)

{-| 
@docs moduleName_, headerStyle, show, headerTagsStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Blog", "PostHeader" ]


{-| headerStyle: String -> List (Html.Attribute msg) -}
headerStyle : String -> Elm.Expression
headerStyle headerStyleArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Blog", "PostHeader" ]
            , name = "headerStyle"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ Elm.string headerStyleArg ]


{-| show: String -> String -> List String -> List String -> Date.Date -> Html.Html msg -}
show :
    String
    -> String
    -> List String
    -> List String
    -> Elm.Expression
    -> Elm.Expression
show showArg showArg0 showArg1 showArg2 showArg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Blog", "PostHeader" ]
            , name = "show"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.string
                        , Type.list Type.string
                        , Type.list Type.string
                        , Type.namedWith [ "Date" ] "Date" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string showArg
        , Elm.string showArg0
        , Elm.list (List.map Elm.string showArg1)
        , Elm.list (List.map Elm.string showArg2)
        , showArg3
        ]


{-| headerTagsStyle: List (Html.Attribute msg) -}
headerTagsStyle : Elm.Expression
headerTagsStyle =
    Elm.value
        { importFrom = [ "Components", "Blog", "PostHeader" ]
        , name = "headerTagsStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


call_ :
    { headerStyle : Elm.Expression -> Elm.Expression
    , show :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
call_ =
    { headerStyle =
        \headerStyleArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Blog", "PostHeader" ]
                    , name = "headerStyle"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ headerStyleArg ]
    , show =
        \showArg showArg0 showArg1 showArg2 showArg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Blog", "PostHeader" ]
                    , name = "show"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.string
                                , Type.list Type.string
                                , Type.list Type.string
                                , Type.namedWith [ "Date" ] "Date" []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ showArg, showArg0, showArg1, showArg2, showArg3 ]
    }


values_ :
    { headerStyle : Elm.Expression
    , show : Elm.Expression
    , headerTagsStyle : Elm.Expression
    }
values_ =
    { headerStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostHeader" ]
            , name = "headerStyle"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        )
                    )
            }
    , show =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostHeader" ]
            , name = "show"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.string
                        , Type.list Type.string
                        , Type.list Type.string
                        , Type.namedWith [ "Date" ] "Date" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , headerTagsStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "PostHeader" ]
            , name = "headerTagsStyle"
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
    }