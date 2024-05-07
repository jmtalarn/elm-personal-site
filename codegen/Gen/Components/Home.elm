module Gen.Components.Home exposing (animatedSvgBackground, antonFontAttributeStyle, attributeLinearGradient, blog, book, call_, caretoStyle, colorfulBlurredBackground, cv, featuredSkillsAndCompaniesLabel, hero, message, moduleName_, portrait, values_, workSansAttributeStyle)

{-| 
@docs moduleName_, featuredSkillsAndCompaniesLabel, animatedSvgBackground, colorfulBlurredBackground, cv, book, attributeLinearGradient, blog, hero, message, workSansAttributeStyle, antonFontAttributeStyle, portrait, caretoStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Home" ]


{-| featuredSkillsAndCompaniesLabel: Html.Html msg -}
featuredSkillsAndCompaniesLabel : Elm.Expression
featuredSkillsAndCompaniesLabel =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "featuredSkillsAndCompaniesLabel"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| animatedSvgBackground: List (Html.Attribute msg) -> Html.Html msg -}
animatedSvgBackground : List Elm.Expression -> Elm.Expression
animatedSvgBackground animatedSvgBackgroundArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "animatedSvgBackground"
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
        [ Elm.list animatedSvgBackgroundArg ]


{-| colorfulBlurredBackground: Html.Html msg -}
colorfulBlurredBackground : Elm.Expression
colorfulBlurredBackground =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "colorfulBlurredBackground"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| cv: Html.Html msg -}
cv : Elm.Expression
cv =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "cv"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| book: Html.Html msg -}
book : Elm.Expression
book =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "book"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| attributeLinearGradient: Html.Attribute msg -}
attributeLinearGradient : Elm.Expression
attributeLinearGradient =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "attributeLinearGradient"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
        }


{-| blog: Html.Html msg -}
blog : Elm.Expression
blog =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "blog"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| hero: Html.Html msg -}
hero : Elm.Expression
hero =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "hero"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| message: Html.Html msg -}
message : Elm.Expression
message =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "message"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


{-| workSansAttributeStyle: List (Html.Attribute msg) -}
workSansAttributeStyle : Elm.Expression
workSansAttributeStyle =
    Elm.value
        { importFrom = [ "Components", "Home" ]
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
        { importFrom = [ "Components", "Home" ]
        , name = "antonFontAttributeStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| portrait: List (Html.Html msg) -}
portrait : Elm.Expression
portrait =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "portrait"
        , annotation =
            Just
                (Type.list (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                )
        }


{-| caretoStyle: List (Html.Attribute msg) -}
caretoStyle : Elm.Expression
caretoStyle =
    Elm.value
        { importFrom = [ "Components", "Home" ]
        , name = "caretoStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


call_ : { animatedSvgBackground : Elm.Expression -> Elm.Expression }
call_ =
    { animatedSvgBackground =
        \animatedSvgBackgroundArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Home" ]
                    , name = "animatedSvgBackground"
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
                [ animatedSvgBackgroundArg ]
    }


values_ :
    { featuredSkillsAndCompaniesLabel : Elm.Expression
    , animatedSvgBackground : Elm.Expression
    , colorfulBlurredBackground : Elm.Expression
    , cv : Elm.Expression
    , book : Elm.Expression
    , attributeLinearGradient : Elm.Expression
    , blog : Elm.Expression
    , hero : Elm.Expression
    , message : Elm.Expression
    , workSansAttributeStyle : Elm.Expression
    , antonFontAttributeStyle : Elm.Expression
    , portrait : Elm.Expression
    , caretoStyle : Elm.Expression
    }
values_ =
    { featuredSkillsAndCompaniesLabel =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "featuredSkillsAndCompaniesLabel"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , animatedSvgBackground =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "animatedSvgBackground"
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
    , colorfulBlurredBackground =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "colorfulBlurredBackground"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , cv =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "cv"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , book =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "book"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , attributeLinearGradient =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "attributeLinearGradient"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
            }
    , blog =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "blog"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , hero =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "hero"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , message =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "message"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    , workSansAttributeStyle =
        Elm.value
            { importFrom = [ "Components", "Home" ]
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
            { importFrom = [ "Components", "Home" ]
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
    , portrait =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "portrait"
            , annotation =
                Just
                    (Type.list
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , caretoStyle =
        Elm.value
            { importFrom = [ "Components", "Home" ]
            , name = "caretoStyle"
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