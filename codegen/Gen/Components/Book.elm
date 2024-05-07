module Gen.Components.Book exposing (book3Danimated, call_, moduleName_, values_)

{-| 
@docs moduleName_, book3Danimated, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Book" ]


{-| book3Danimated: Bool -> Html.Html msg -}
book3Danimated : Bool -> Elm.Expression
book3Danimated book3DanimatedArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Book" ]
            , name = "book3Danimated"
            , annotation =
                Just
                    (Type.function
                        [ Type.bool ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.bool book3DanimatedArg ]


call_ : { book3Danimated : Elm.Expression -> Elm.Expression }
call_ =
    { book3Danimated =
        \book3DanimatedArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Book" ]
                    , name = "book3Danimated"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.bool ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ book3DanimatedArg ]
    }


values_ : { book3Danimated : Elm.Expression }
values_ =
    { book3Danimated =
        Elm.value
            { importFrom = [ "Components", "Book" ]
            , name = "book3Danimated"
            , annotation =
                Just
                    (Type.function
                        [ Type.bool ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }