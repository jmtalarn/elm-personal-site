module Gen.Components.Blog.Pagination exposing (call_, moduleName_, pagination, paginationStyle, values_)

{-| 
@docs moduleName_, pagination, paginationStyle, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "Blog", "Pagination" ]


{-| pagination: Int -> Int -> Html.Html msg -}
pagination : Int -> Int -> Elm.Expression
pagination paginationArg paginationArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "Blog", "Pagination" ]
            , name = "pagination"
            , annotation =
                Just
                    (Type.function
                        [ Type.int, Type.int ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.int paginationArg, Elm.int paginationArg0 ]


{-| paginationStyle: Html.Html msg -}
paginationStyle : Elm.Expression
paginationStyle =
    Elm.value
        { importFrom = [ "Components", "Blog", "Pagination" ]
        , name = "paginationStyle"
        , annotation =
            Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
        }


call_ : { pagination : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { pagination =
        \paginationArg paginationArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "Blog", "Pagination" ]
                    , name = "pagination"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int, Type.int ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ paginationArg, paginationArg0 ]
    }


values_ : { pagination : Elm.Expression, paginationStyle : Elm.Expression }
values_ =
    { pagination =
        Elm.value
            { importFrom = [ "Components", "Blog", "Pagination" ]
            , name = "pagination"
            , annotation =
                Just
                    (Type.function
                        [ Type.int, Type.int ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , paginationStyle =
        Elm.value
            { importFrom = [ "Components", "Blog", "Pagination" ]
            , name = "paginationStyle"
            , annotation =
                Just (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
            }
    }