module Gen.Components.NavBar exposing (antonFontAttributeStyle, call_, dialog, dialogId, gradientColorEffect, moduleName_, navBarStyle, regularDialogFont, siteTitle, svgHueRotateFilter, values_, view, whiteLinksStyle, workSansAttributeStyle)

{-| 
@docs moduleName_, dialog, regularDialogFont, dialogId, view, siteTitle, workSansAttributeStyle, antonFontAttributeStyle, whiteLinksStyle, svgHueRotateFilter, gradientColorEffect, navBarStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "NavBar" ]


{-| dialog: msg -> Html.Html msg -}
dialog : Elm.Expression -> Elm.Expression
dialog dialogArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "dialog"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "msg" ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ dialogArg ]


{-| regularDialogFont: List (Html.Attribute msg) -}
regularDialogFont : Elm.Expression
regularDialogFont =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "regularDialogFont"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| dialogId: String -}
dialogId : Elm.Expression
dialogId =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "dialogId"
        , annotation = Just Type.string
        }


{-| view: { a | showMenu : Bool } -> msg -> Html.Html msg -}
view : { a | showMenu : Bool } -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.extensible "a" [ ( "showMenu", Type.bool ) ]
                        , Type.var "msg"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.record [ Tuple.pair "showMenu" (Elm.bool viewArg.showMenu) ]
        , viewArg0
        ]


{-| siteTitle: List (Html.Attribute msg) -> Html.Html msg -}
siteTitle : List Elm.Expression -> Elm.Expression
siteTitle siteTitleArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "siteTitle"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list siteTitleArg ]


{-| workSansAttributeStyle: List (Html.Attribute msg) -}
workSansAttributeStyle : Elm.Expression
workSansAttributeStyle =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "workSansAttributeStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| antonFontAttributeStyle: List (Html.Attribute msg) -}
antonFontAttributeStyle : Elm.Expression
antonFontAttributeStyle =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "antonFontAttributeStyle"
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
        { importFrom = [ "Components", "NavBar" ]
        , name = "whiteLinksStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| svgHueRotateFilter: Html.Html msg -}
svgHueRotateFilter : Elm.Expression
svgHueRotateFilter =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "svgHueRotateFilter"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| gradientColorEffect: List (Html.Attribute msg) -}
gradientColorEffect : Elm.Expression
gradientColorEffect =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "gradientColorEffect"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| navBarStyle: List (Html.Attribute msg) -}
navBarStyle : Elm.Expression
navBarStyle =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "navBarStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


call_ :
    { dialog : Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression -> Elm.Expression
    , siteTitle : Elm.Expression -> Elm.Expression
    }
call_ =
    { dialog =
        \dialogArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "NavBar" ]
                    , name = "dialog"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "msg" ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ dialogArg ]
    , view =
        \viewArg viewArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "NavBar" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.extensible
                                    "a"
                                    [ ( "showMenu", Type.bool ) ]
                                , Type.var "msg"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    , siteTitle =
        \siteTitleArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "NavBar" ]
                    , name = "siteTitle"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ siteTitleArg ]
    }


values_ :
    { dialog : Elm.Expression
    , regularDialogFont : Elm.Expression
    , dialogId : Elm.Expression
    , view : Elm.Expression
    , siteTitle : Elm.Expression
    , workSansAttributeStyle : Elm.Expression
    , antonFontAttributeStyle : Elm.Expression
    , whiteLinksStyle : Elm.Expression
    , svgHueRotateFilter : Elm.Expression
    , gradientColorEffect : Elm.Expression
    , navBarStyle : Elm.Expression
    }
values_ =
    { dialog =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "dialog"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "msg" ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , regularDialogFont =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "regularDialogFont"
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
    , dialogId =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "dialogId"
            , annotation = Just Type.string
            }
    , view =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.extensible "a" [ ( "showMenu", Type.bool ) ]
                        , Type.var "msg"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , siteTitle =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "siteTitle"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , workSansAttributeStyle =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "workSansAttributeStyle"
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
    , antonFontAttributeStyle =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "antonFontAttributeStyle"
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
            { importFrom = [ "Components", "NavBar" ]
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
    , svgHueRotateFilter =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "svgHueRotateFilter"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , gradientColorEffect =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "gradientColorEffect"
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
    , navBarStyle =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "navBarStyle"
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