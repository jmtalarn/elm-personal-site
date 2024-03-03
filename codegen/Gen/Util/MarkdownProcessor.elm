module Gen.Util.MarkdownProcessor exposing (call_, markdownToText, markdownToView, moduleName_, values_)

{-| 
@docs moduleName_, markdownToText, markdownToView, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Util", "MarkdownProcessor" ]


{-| markdownToText: String -> String -}
markdownToText : String -> Elm.Expression
markdownToText markdownToTextArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "markdownToText"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
        )
        [ Elm.string markdownToTextArg ]


{-| markdownToView: String -> List (Html.Html msg) -}
markdownToView : String -> Elm.Expression
markdownToView markdownToViewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "markdownToView"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ Elm.string markdownToViewArg ]


call_ :
    { markdownToText : Elm.Expression -> Elm.Expression
    , markdownToView : Elm.Expression -> Elm.Expression
    }
call_ =
    { markdownToText =
        \markdownToTextArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "MarkdownProcessor" ]
                    , name = "markdownToText"
                    , annotation =
                        Just (Type.function [ Type.string ] Type.string)
                    }
                )
                [ markdownToTextArg ]
    , markdownToView =
        \markdownToViewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "MarkdownProcessor" ]
                    , name = "markdownToView"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ markdownToViewArg ]
    }


values_ : { markdownToText : Elm.Expression, markdownToView : Elm.Expression }
values_ =
    { markdownToText =
        Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "markdownToText"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , markdownToView =
        Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "markdownToView"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
    }