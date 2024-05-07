module Gen.Util.MarkdownProcessor exposing (call_, getAbstract, markdownToPlainHtml, markdownToText, markdownToView, moduleName_, values_)

{-| 
@docs moduleName_, getAbstract, markdownToPlainHtml, markdownToText, markdownToView, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Util", "MarkdownProcessor" ]


{-| getAbstract: String -> String -}
getAbstract : String -> Elm.Expression
getAbstract getAbstractArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "getAbstract"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
        )
        [ Elm.string getAbstractArg ]


{-| markdownToPlainHtml: String -> String -}
markdownToPlainHtml : String -> Elm.Expression
markdownToPlainHtml markdownToPlainHtmlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "markdownToPlainHtml"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
        )
        [ Elm.string markdownToPlainHtmlArg ]


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
    { getAbstract : Elm.Expression -> Elm.Expression
    , markdownToPlainHtml : Elm.Expression -> Elm.Expression
    , markdownToText : Elm.Expression -> Elm.Expression
    , markdownToView : Elm.Expression -> Elm.Expression
    }
call_ =
    { getAbstract =
        \getAbstractArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "MarkdownProcessor" ]
                    , name = "getAbstract"
                    , annotation =
                        Just (Type.function [ Type.string ] Type.string)
                    }
                )
                [ getAbstractArg ]
    , markdownToPlainHtml =
        \markdownToPlainHtmlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "MarkdownProcessor" ]
                    , name = "markdownToPlainHtml"
                    , annotation =
                        Just (Type.function [ Type.string ] Type.string)
                    }
                )
                [ markdownToPlainHtmlArg ]
    , markdownToText =
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


values_ :
    { getAbstract : Elm.Expression
    , markdownToPlainHtml : Elm.Expression
    , markdownToText : Elm.Expression
    , markdownToView : Elm.Expression
    }
values_ =
    { getAbstract =
        Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "getAbstract"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , markdownToPlainHtml =
        Elm.value
            { importFrom = [ "Util", "MarkdownProcessor" ]
            , name = "markdownToPlainHtml"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , markdownToText =
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