module Gen.Components.Icons.ManfredLogo exposing (call_, logo, moduleName_, values_)

{-| 
@docs moduleName_, logo, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Icons", "ManfredLogo" ]


{-| logo: List (Svg.Attribute msg) -> Components.Icons.ManfredLogo.Html msg -}
logo : List Elm.Expression -> Elm.Expression
logo logoArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Icons", "ManfredLogo" ]
            , name = "logo"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Svg" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith
                            [ "Components", "Icons", "ManfredLogo" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.list logoArg ]


call_ : { logo : Elm.Expression -> Elm.Expression }
call_ =
    { logo =
        \logoArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Icons", "ManfredLogo" ]
                    , name = "logo"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Svg" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Components", "Icons", "ManfredLogo" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ logoArg ]
    }


values_ : { logo : Elm.Expression }
values_ =
    { logo =
        Elm.value
            { importFrom = [ "Components", "Icons", "ManfredLogo" ]
            , name = "logo"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Svg" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith
                            [ "Components", "Icons", "ManfredLogo" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
    }