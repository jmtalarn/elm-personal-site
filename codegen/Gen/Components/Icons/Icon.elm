module Gen.Components.Icons.Icon exposing (call_, duotone, fill, light, markdownIcon, moduleName_, regular, values_)

{-| 
@docs moduleName_, markdownIcon, duotone, regular, fill, light, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Icons", "Icon" ]


{-| markdownIcon: String -> Maybe String -> Maybe String -> List (Html.Html msg) -> Html.Html msg -}
markdownIcon :
    String
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
markdownIcon markdownIconArg markdownIconArg0 markdownIconArg1 markdownIconArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "markdownIcon"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string markdownIconArg
        , markdownIconArg0
        , markdownIconArg1
        , Elm.list markdownIconArg2
        ]


{-| duotone: Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html.Html msg -}
duotone : Elm.Expression -> Elm.Expression -> Elm.Expression
duotone duotoneArg duotoneArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "duotone"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ duotoneArg, duotoneArg0 ]


{-| regular: Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html.Html msg -}
regular : Elm.Expression -> Elm.Expression -> Elm.Expression
regular regularArg regularArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "regular"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ regularArg, regularArg0 ]


{-| fill: Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html.Html msg -}
fill : Elm.Expression -> Elm.Expression -> Elm.Expression
fill fillArg fillArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "fill"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ fillArg, fillArg0 ]


{-| light: Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html.Html msg -}
light : Elm.Expression -> Elm.Expression -> Elm.Expression
light lightArg lightArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "light"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ lightArg, lightArg0 ]


call_ :
    { markdownIcon :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , duotone : Elm.Expression -> Elm.Expression -> Elm.Expression
    , regular : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fill : Elm.Expression -> Elm.Expression -> Elm.Expression
    , light : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { markdownIcon =
        \markdownIconArg markdownIconArg0 markdownIconArg1 markdownIconArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Icons", "Icon" ]
                    , name = "markdownIcon"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
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
                [ markdownIconArg
                , markdownIconArg0
                , markdownIconArg1
                , markdownIconArg2
                ]
    , duotone =
        \duotoneArg duotoneArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Icons", "Icon" ]
                    , name = "duotone"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Phosphor" ] "Icon" []
                                , Type.maybe
                                    (Type.list
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
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
                [ duotoneArg, duotoneArg0 ]
    , regular =
        \regularArg regularArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Icons", "Icon" ]
                    , name = "regular"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Phosphor" ] "Icon" []
                                , Type.maybe
                                    (Type.list
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
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
                [ regularArg, regularArg0 ]
    , fill =
        \fillArg fillArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Icons", "Icon" ]
                    , name = "fill"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Phosphor" ] "Icon" []
                                , Type.maybe
                                    (Type.list
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
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
                [ fillArg, fillArg0 ]
    , light =
        \lightArg lightArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Icons", "Icon" ]
                    , name = "light"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Phosphor" ] "Icon" []
                                , Type.maybe
                                    (Type.list
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
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
                [ lightArg, lightArg0 ]
    }


values_ :
    { markdownIcon : Elm.Expression
    , duotone : Elm.Expression
    , regular : Elm.Expression
    , fill : Elm.Expression
    , light : Elm.Expression
    }
values_ =
    { markdownIcon =
        Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "markdownIcon"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , duotone =
        Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "duotone"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , regular =
        Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "regular"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , fill =
        Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "fill"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , light =
        Elm.value
            { importFrom = [ "Components", "Icons", "Icon" ]
            , name = "light"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Phosphor" ] "Icon" []
                        , Type.maybe
                            (Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }