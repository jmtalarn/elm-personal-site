module Gen.Components.TwitterTweet exposing (call_, moduleName_, twitterTweet, values_)

{-| 
@docs moduleName_, twitterTweet, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "TwitterTweet" ]


{-| twitterTweet: List (Html.Html msg) -> Html.Html msg -}
twitterTweet : List Elm.Expression -> Elm.Expression
twitterTweet twitterTweetArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "TwitterTweet" ]
            , name = "twitterTweet"
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
        [ Elm.list twitterTweetArg ]


call_ : { twitterTweet : Elm.Expression -> Elm.Expression }
call_ =
    { twitterTweet =
        \twitterTweetArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "TwitterTweet" ]
                    , name = "twitterTweet"
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
                [ twitterTweetArg ]
    }


values_ : { twitterTweet : Elm.Expression }
values_ =
    { twitterTweet =
        Elm.value
            { importFrom = [ "Components", "TwitterTweet" ]
            , name = "twitterTweet"
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