module Gen.Components.NavBar exposing (call_, menuStyle, moduleName_, navBarStyle, values_, view)

{-| 
@docs moduleName_, view, menuStyle, navBarStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "NavBar" ]


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


{-| menuStyle: List (Html.Attribute msg) -}
menuStyle : Elm.Expression
menuStyle =
    Elm.value
        { importFrom = [ "Components", "NavBar" ]
        , name = "menuStyle"
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


call_ : { view : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { view =
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
    }


values_ :
    { view : Elm.Expression
    , menuStyle : Elm.Expression
    , navBarStyle : Elm.Expression
    }
values_ =
    { view =
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
    , menuStyle =
        Elm.value
            { importFrom = [ "Components", "NavBar" ]
            , name = "menuStyle"
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