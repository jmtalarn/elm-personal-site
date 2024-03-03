module Gen.Components.WarningBox exposing (call_, moduleName_, values_, warningBox)

{-| 
@docs moduleName_, warningBox, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "WarningBox" ]


{-| warningBox: List (Html.Html msg) -> Html.Html msg -}
warningBox : List Elm.Expression -> Elm.Expression
warningBox warningBoxArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "WarningBox" ]
            , name = "warningBox"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list warningBoxArg ]


call_ : { warningBox : Elm.Expression -> Elm.Expression }
call_ =
    { warningBox =
        \warningBoxArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "WarningBox" ]
                    , name = "warningBox"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
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
                [ warningBoxArg ]
    }


values_ : { warningBox : Elm.Expression }
values_ =
    { warningBox =
        Elm.value
            { importFrom = [ "Components", "WarningBox" ]
            , name = "warningBox"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }