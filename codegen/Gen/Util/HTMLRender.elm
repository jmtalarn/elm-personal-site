module Gen.Util.HTMLRender exposing (call_, codeBlock, codeBlockStyle, imageStyle, moduleName_, printStartsOutOf, processStyleAttribute, showBlockquote, showCodeBlock, showDefinitionDescription, showDefinitionList, showDefinitionTerm, showDiv, showEasyLikeScore, showHeading, showIframe, showImage, showLink, showSpan, showTable, showTableBody, showTableData, showTableHead, showTableHeader, showTableRow, values_)

{-| 
@docs moduleName_, showCodeBlock, codeBlockStyle, codeBlock, showEasyLikeScore, printStartsOutOf, showDefinitionDescription, showDefinitionTerm, showDefinitionList, showImage, imageStyle, showTableData, showTableRow, showTableHeader, showTableBody, showTableHead, showTable, showHeading, showBlockquote, showLink, showIframe, showSpan, showDiv, processStyleAttribute, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Util", "HTMLRender" ]


{-| showCodeBlock: Maybe String -> List (Html.Html msg) -> Html.Html msg -}
showCodeBlock : Elm.Expression -> List Elm.Expression -> Elm.Expression
showCodeBlock showCodeBlockArg showCodeBlockArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showCodeBlock"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ showCodeBlockArg, Elm.list showCodeBlockArg0 ]


{-| codeBlockStyle: List (Html.Attribute msg) -}
codeBlockStyle : Elm.Expression
codeBlockStyle =
    Elm.value
        { importFrom = [ "Util", "HTMLRender" ]
        , name = "codeBlockStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| codeBlock: { body : String, language : Maybe String } -> Html.Html msg -}
codeBlock : { body : String, language : Elm.Expression } -> Elm.Expression
codeBlock codeBlockArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "codeBlock"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "body", Type.string )
                            , ( "language", Type.maybe Type.string )
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "body" (Elm.string codeBlockArg.body)
            , Tuple.pair "language" codeBlockArg.language
            ]
        ]


{-| showEasyLikeScore: String -> String -> List (Html.Html msg) -> Html.Html msg -}
showEasyLikeScore : String -> String -> List Elm.Expression -> Elm.Expression
showEasyLikeScore showEasyLikeScoreArg showEasyLikeScoreArg0 showEasyLikeScoreArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showEasyLikeScore"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string showEasyLikeScoreArg
        , Elm.string showEasyLikeScoreArg0
        , Elm.list showEasyLikeScoreArg1
        ]


{-| printStartsOutOf: Int -> Int -> String -}
printStartsOutOf : Int -> Int -> Elm.Expression
printStartsOutOf printStartsOutOfArg printStartsOutOfArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "printStartsOutOf"
            , annotation =
                Just (Type.function [ Type.int, Type.int ] Type.string)
            }
        )
        [ Elm.int printStartsOutOfArg, Elm.int printStartsOutOfArg0 ]


{-| showDefinitionDescription: List (Html.Html msg) -> Html.Html msg -}
showDefinitionDescription : List Elm.Expression -> Elm.Expression
showDefinitionDescription showDefinitionDescriptionArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDefinitionDescription"
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
        [ Elm.list showDefinitionDescriptionArg ]


{-| showDefinitionTerm: Maybe String -> List (Html.Html msg) -> Html.Html msg -}
showDefinitionTerm : Elm.Expression -> List Elm.Expression -> Elm.Expression
showDefinitionTerm showDefinitionTermArg showDefinitionTermArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDefinitionTerm"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ showDefinitionTermArg, Elm.list showDefinitionTermArg0 ]


{-| showDefinitionList: List (Html.Html msg) -> Html.Html msg -}
showDefinitionList : List Elm.Expression -> Elm.Expression
showDefinitionList showDefinitionListArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDefinitionList"
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
        [ Elm.list showDefinitionListArg ]


{-| showImage: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showImage :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> String
    -> List Elm.Expression
    -> Elm.Expression
showImage showImageArg showImageArg0 showImageArg1 showImageArg2 showImageArg3 showImageArg4 showImageArg5 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showImage"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ showImageArg
        , showImageArg0
        , showImageArg1
        , showImageArg2
        , showImageArg3
        , Elm.string showImageArg4
        , Elm.list showImageArg5
        ]


{-| imageStyle: List (Html.Attribute msg) -}
imageStyle : Elm.Expression
imageStyle =
    Elm.value
        { importFrom = [ "Util", "HTMLRender" ]
        , name = "imageStyle"
        , annotation =
            Just
                (Type.list
                    (Type.namedWith [ "Html" ] "Attribute" [ Type.var "msg" ])
                )
        }


{-| showTableData: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showTableData :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showTableData showTableDataArg showTableDataArg0 showTableDataArg1 showTableDataArg2 showTableDataArg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableData"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
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
        [ showTableDataArg
        , showTableDataArg0
        , showTableDataArg1
        , showTableDataArg2
        , Elm.list showTableDataArg3
        ]


{-| showTableRow: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showTableRow :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showTableRow showTableRowArg showTableRowArg0 showTableRowArg1 showTableRowArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableRow"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
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
        [ showTableRowArg
        , showTableRowArg0
        , showTableRowArg1
        , Elm.list showTableRowArg2
        ]


{-| showTableHeader: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showTableHeader :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showTableHeader showTableHeaderArg showTableHeaderArg0 showTableHeaderArg1 showTableHeaderArg2 showTableHeaderArg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableHeader"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
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
        [ showTableHeaderArg
        , showTableHeaderArg0
        , showTableHeaderArg1
        , showTableHeaderArg2
        , Elm.list showTableHeaderArg3
        ]


{-| showTableBody: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showTableBody :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showTableBody showTableBodyArg showTableBodyArg0 showTableBodyArg1 showTableBodyArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableBody"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
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
        [ showTableBodyArg
        , showTableBodyArg0
        , showTableBodyArg1
        , Elm.list showTableBodyArg2
        ]


{-| showTableHead: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showTableHead :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showTableHead showTableHeadArg showTableHeadArg0 showTableHeadArg1 showTableHeadArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableHead"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
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
        [ showTableHeadArg
        , showTableHeadArg0
        , showTableHeadArg1
        , Elm.list showTableHeadArg2
        ]


{-| showTable: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showTable :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showTable showTableArg showTableArg0 showTableArg1 showTableArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTable"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
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
        [ showTableArg, showTableArg0, showTableArg1, Elm.list showTableArg2 ]


{-| showHeading: Int -> Maybe String -> Maybe String -> List (Html.Html msg) -> Html.Html msg -}
showHeading :
    Int
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showHeading showHeadingArg showHeadingArg0 showHeadingArg1 showHeadingArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showHeading"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
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
        [ Elm.int showHeadingArg
        , showHeadingArg0
        , showHeadingArg1
        , Elm.list showHeadingArg2
        ]


{-| showBlockquote: Maybe String -> List (Html.Html msg) -> Html.Html msg -}
showBlockquote : Elm.Expression -> List Elm.Expression -> Elm.Expression
showBlockquote showBlockquoteArg showBlockquoteArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showBlockquote"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ showBlockquoteArg, Elm.list showBlockquoteArg0 ]


{-| showLink: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showLink :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showLink showLinkArg showLinkArg0 showLinkArg1 showLinkArg2 showLinkArg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
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
        [ showLinkArg
        , showLinkArg0
        , showLinkArg1
        , showLinkArg2
        , Elm.list showLinkArg3
        ]


{-| showIframe: 
    String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showIframe :
    String
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showIframe showIframeArg showIframeArg0 showIframeArg1 showIframeArg2 showIframeArg3 showIframeArg4 showIframeArg5 showIframeArg6 showIframeArg7 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showIframe"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
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
        [ Elm.string showIframeArg
        , showIframeArg0
        , showIframeArg1
        , showIframeArg2
        , showIframeArg3
        , showIframeArg4
        , showIframeArg5
        , showIframeArg6
        , Elm.list showIframeArg7
        ]


{-| showSpan: Maybe String -> Maybe String -> List (Html.Html msg) -> Html.Html msg -}
showSpan :
    Elm.Expression -> Elm.Expression -> List Elm.Expression -> Elm.Expression
showSpan showSpanArg showSpanArg0 showSpanArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showSpan"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ showSpanArg, showSpanArg0, Elm.list showSpanArg1 ]


{-| showDiv: 
    Maybe String
    -> Maybe String
    -> Maybe String
    -> List (Html.Html msg)
    -> Html.Html msg
-}
showDiv :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
showDiv showDivArg showDivArg0 showDivArg1 showDivArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDiv"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
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
        [ showDivArg, showDivArg0, showDivArg1, Elm.list showDivArg2 ]


{-| processStyleAttribute: String -> List (Html.Attribute msg) -}
processStyleAttribute : String -> Elm.Expression
processStyleAttribute processStyleAttributeArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "processStyleAttribute"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ Elm.string processStyleAttributeArg ]


call_ :
    { showCodeBlock : Elm.Expression -> Elm.Expression -> Elm.Expression
    , codeBlock : Elm.Expression -> Elm.Expression
    , showEasyLikeScore :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , printStartsOutOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , showDefinitionDescription : Elm.Expression -> Elm.Expression
    , showDefinitionTerm : Elm.Expression -> Elm.Expression -> Elm.Expression
    , showDefinitionList : Elm.Expression -> Elm.Expression
    , showImage :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showTableData :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showTableRow :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showTableHeader :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showTableBody :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showTableHead :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showTable :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showHeading :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showBlockquote : Elm.Expression -> Elm.Expression -> Elm.Expression
    , showLink :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showIframe :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , showSpan :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , showDiv :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , processStyleAttribute : Elm.Expression -> Elm.Expression
    }
call_ =
    { showCodeBlock =
        \showCodeBlockArg showCodeBlockArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showCodeBlock"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showCodeBlockArg, showCodeBlockArg0 ]
    , codeBlock =
        \codeBlockArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "codeBlock"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "body", Type.string )
                                    , ( "language", Type.maybe Type.string )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ codeBlockArg ]
    , showEasyLikeScore =
        \showEasyLikeScoreArg showEasyLikeScoreArg0 showEasyLikeScoreArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showEasyLikeScore"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.string
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
                [ showEasyLikeScoreArg
                , showEasyLikeScoreArg0
                , showEasyLikeScoreArg1
                ]
    , printStartsOutOf =
        \printStartsOutOfArg printStartsOutOfArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "printStartsOutOf"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.string)
                    }
                )
                [ printStartsOutOfArg, printStartsOutOfArg0 ]
    , showDefinitionDescription =
        \showDefinitionDescriptionArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showDefinitionDescription"
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
                [ showDefinitionDescriptionArg ]
    , showDefinitionTerm =
        \showDefinitionTermArg showDefinitionTermArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showDefinitionTerm"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showDefinitionTermArg, showDefinitionTermArg0 ]
    , showDefinitionList =
        \showDefinitionListArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showDefinitionList"
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
                [ showDefinitionListArg ]
    , showImage =
        \showImageArg showImageArg0 showImageArg1 showImageArg2 showImageArg3 showImageArg4 showImageArg5 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showImage"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.string
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
                [ showImageArg
                , showImageArg0
                , showImageArg1
                , showImageArg2
                , showImageArg3
                , showImageArg4
                , showImageArg5
                ]
    , showTableData =
        \showTableDataArg showTableDataArg0 showTableDataArg1 showTableDataArg2 showTableDataArg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showTableData"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
                                , Type.maybe Type.string
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
                [ showTableDataArg
                , showTableDataArg0
                , showTableDataArg1
                , showTableDataArg2
                , showTableDataArg3
                ]
    , showTableRow =
        \showTableRowArg showTableRowArg0 showTableRowArg1 showTableRowArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showTableRow"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showTableRowArg
                , showTableRowArg0
                , showTableRowArg1
                , showTableRowArg2
                ]
    , showTableHeader =
        \showTableHeaderArg showTableHeaderArg0 showTableHeaderArg1 showTableHeaderArg2 showTableHeaderArg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showTableHeader"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
                                , Type.maybe Type.string
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
                [ showTableHeaderArg
                , showTableHeaderArg0
                , showTableHeaderArg1
                , showTableHeaderArg2
                , showTableHeaderArg3
                ]
    , showTableBody =
        \showTableBodyArg showTableBodyArg0 showTableBodyArg1 showTableBodyArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showTableBody"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showTableBodyArg
                , showTableBodyArg0
                , showTableBodyArg1
                , showTableBodyArg2
                ]
    , showTableHead =
        \showTableHeadArg showTableHeadArg0 showTableHeadArg1 showTableHeadArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showTableHead"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showTableHeadArg
                , showTableHeadArg0
                , showTableHeadArg1
                , showTableHeadArg2
                ]
    , showTable =
        \showTableArg showTableArg0 showTableArg1 showTableArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showTable"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showTableArg, showTableArg0, showTableArg1, showTableArg2 ]
    , showHeading =
        \showHeadingArg showHeadingArg0 showHeadingArg1 showHeadingArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showHeading"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int
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
                [ showHeadingArg
                , showHeadingArg0
                , showHeadingArg1
                , showHeadingArg2
                ]
    , showBlockquote =
        \showBlockquoteArg showBlockquoteArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showBlockquote"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showBlockquoteArg, showBlockquoteArg0 ]
    , showLink =
        \showLinkArg showLinkArg0 showLinkArg1 showLinkArg2 showLinkArg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showLink"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
                                , Type.maybe Type.string
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
                [ showLinkArg
                , showLinkArg0
                , showLinkArg1
                , showLinkArg2
                , showLinkArg3
                ]
    , showIframe =
        \showIframeArg showIframeArg0 showIframeArg1 showIframeArg2 showIframeArg3 showIframeArg4 showIframeArg5 showIframeArg6 showIframeArg7 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showIframe"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
                                , Type.maybe Type.string
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
                [ showIframeArg
                , showIframeArg0
                , showIframeArg1
                , showIframeArg2
                , showIframeArg3
                , showIframeArg4
                , showIframeArg5
                , showIframeArg6
                , showIframeArg7
                ]
    , showSpan =
        \showSpanArg showSpanArg0 showSpanArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showSpan"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showSpanArg, showSpanArg0, showSpanArg1 ]
    , showDiv =
        \showDivArg showDivArg0 showDivArg1 showDivArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "showDiv"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe Type.string
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
                [ showDivArg, showDivArg0, showDivArg1, showDivArg2 ]
    , processStyleAttribute =
        \processStyleAttributeArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util", "HTMLRender" ]
                    , name = "processStyleAttribute"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ processStyleAttributeArg ]
    }


values_ :
    { showCodeBlock : Elm.Expression
    , codeBlockStyle : Elm.Expression
    , codeBlock : Elm.Expression
    , showEasyLikeScore : Elm.Expression
    , printStartsOutOf : Elm.Expression
    , showDefinitionDescription : Elm.Expression
    , showDefinitionTerm : Elm.Expression
    , showDefinitionList : Elm.Expression
    , showImage : Elm.Expression
    , imageStyle : Elm.Expression
    , showTableData : Elm.Expression
    , showTableRow : Elm.Expression
    , showTableHeader : Elm.Expression
    , showTableBody : Elm.Expression
    , showTableHead : Elm.Expression
    , showTable : Elm.Expression
    , showHeading : Elm.Expression
    , showBlockquote : Elm.Expression
    , showLink : Elm.Expression
    , showIframe : Elm.Expression
    , showSpan : Elm.Expression
    , showDiv : Elm.Expression
    , processStyleAttribute : Elm.Expression
    }
values_ =
    { showCodeBlock =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showCodeBlock"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , codeBlockStyle =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "codeBlockStyle"
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
    , codeBlock =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "codeBlock"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "body", Type.string )
                            , ( "language", Type.maybe Type.string )
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showEasyLikeScore =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showEasyLikeScore"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , printStartsOutOf =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "printStartsOutOf"
            , annotation =
                Just (Type.function [ Type.int, Type.int ] Type.string)
            }
    , showDefinitionDescription =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDefinitionDescription"
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
    , showDefinitionTerm =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDefinitionTerm"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showDefinitionList =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDefinitionList"
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
    , showImage =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showImage"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , imageStyle =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "imageStyle"
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
    , showTableData =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableData"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showTableRow =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableRow"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showTableHeader =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableHeader"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showTableBody =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableBody"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showTableHead =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTableHead"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showTable =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showTable"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showHeading =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showHeading"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showBlockquote =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showBlockquote"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showLink =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showIframe =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showIframe"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showSpan =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showSpan"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , showDiv =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "showDiv"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.maybe Type.string
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , processStyleAttribute =
        Elm.value
            { importFrom = [ "Util", "HTMLRender" ]
            , name = "processStyleAttribute"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        )
                    )
            }
    }