module Gen.Components.Footer exposing (call_, footer, footerStyle, moduleName_, socialLink, values_, whiteLinksStyle)

{-| 
@docs moduleName_, footer, socialLink, whiteLinksStyle, footerStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Footer" ]


{-| footer: Time.Posix -> Html.Html msg -}
footer : Elm.Expression -> Elm.Expression
footer footerArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "footer"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Time" ] "Posix" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ footerArg ]


{-| socialLink: String -> String -> Phosphor.Icon -> Html.Html msg -}
socialLink : String -> String -> Elm.Expression -> Elm.Expression
socialLink socialLinkArg socialLinkArg0 socialLinkArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "socialLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.string
                        , Type.namedWith [ "Phosphor" ] "Icon" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string socialLinkArg, Elm.string socialLinkArg0, socialLinkArg1 ]


{-| whiteLinksStyle: List (Html.Attribute msg) -}
whiteLinksStyle : Elm.Expression
whiteLinksStyle =
    Elm.value
        { importFrom = [ "Components", "Footer" ]
        , name = "whiteLinksStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| footerStyle: List (Html.Attribute msg) -}
footerStyle : Elm.Expression
footerStyle =
    Elm.value
        { importFrom = [ "Components", "Footer" ]
        , name = "footerStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


call_ :
    { footer : Elm.Expression -> Elm.Expression
    , socialLink :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { footer =
        \footerArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Footer" ]
                    , name = "footer"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Time" ] "Posix" [] ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ footerArg ]
    , socialLink =
        \socialLinkArg socialLinkArg0 socialLinkArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Footer" ]
                    , name = "socialLink"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.string
                                , Type.namedWith [ "Phosphor" ] "Icon" []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ socialLinkArg, socialLinkArg0, socialLinkArg1 ]
    }


values_ :
    { footer : Elm.Expression
    , socialLink : Elm.Expression
    , whiteLinksStyle : Elm.Expression
    , footerStyle : Elm.Expression
    }
values_ =
    { footer =
        Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "footer"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Time" ] "Posix" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , socialLink =
        Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "socialLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.string
                        , Type.namedWith [ "Phosphor" ] "Icon" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , whiteLinksStyle =
        Elm.value
            { importFrom = [ "Components", "Footer" ]
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
    , footerStyle =
        Elm.value
            { importFrom = [ "Components", "Footer" ]
            , name = "footerStyle"
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