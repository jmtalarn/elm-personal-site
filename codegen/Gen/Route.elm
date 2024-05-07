module Gen.Route exposing (annotation_, baseUrl, baseUrlAsPath, call_, caseOf_, link, make_, moduleName_, redirectTo, routeToPath, segmentsToRoute, toLink, toPath, toString, urlToRoute, values_, withoutBaseUrl)

{-| 
@docs moduleName_, withoutBaseUrl, link, toLink, redirectTo, toString, toPath, baseUrlAsPath, routeToPath, baseUrl, urlToRoute, segmentsToRoute, annotation_, make_, caseOf_, call_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route" ]


{-| {-| . -}

withoutBaseUrl: String -> String
-}
withoutBaseUrl : String -> Elm.Expression
withoutBaseUrl withoutBaseUrlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "withoutBaseUrl"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
        )
        [ Elm.string withoutBaseUrlArg ]


{-| {-| . -}

link: 
    List (Html.Attribute msg)
    -> List (Html.Html msg)
    -> Route.Route
    -> Html.Html msg
-}
link :
    List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
link linkArg linkArg0 linkArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "link"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list linkArg, Elm.list linkArg0, linkArg1 ]


{-| {-| . -}

toLink: (List (Html.Attribute msg) -> abc) -> Route.Route -> abc
-}
toLink : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
toLink toLinkArg toLinkArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.var "abc")
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.var "abc")
                    )
            }
        )
        [ Elm.functionReduced "toLinkUnpack" toLinkArg, toLinkArg0 ]


{-| {-| . -}

redirectTo: Route.Route -> Server.Response.Response data error
-}
redirectTo : Elm.Expression -> Elm.Expression
redirectTo redirectToArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "redirectTo"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        (Type.namedWith
                            [ "Server", "Response" ]
                            "Response"
                            [ Type.var "data", Type.var "error" ]
                        )
                    )
            }
        )
        [ redirectToArg ]


{-| {-| . -}

toString: Route.Route -> String
-}
toString : Elm.Expression -> Elm.Expression
toString toStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        Type.string
                    )
            }
        )
        [ toStringArg ]


{-| {-| . -}

toPath: Route.Route -> UrlPath.UrlPath
-}
toPath : Elm.Expression -> Elm.Expression
toPath toPathArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        (Type.namedWith [ "UrlPath" ] "UrlPath" [])
                    )
            }
        )
        [ toPathArg ]


{-| {-| . -}

baseUrlAsPath: List String
-}
baseUrlAsPath : Elm.Expression
baseUrlAsPath =
    Elm.value
        { importFrom = [ "Route" ]
        , name = "baseUrlAsPath"
        , annotation = Just (Type.list Type.string)
        }


{-| {-| . -}

routeToPath: Route.Route -> List String
-}
routeToPath : Elm.Expression -> Elm.Expression
routeToPath routeToPathArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "routeToPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        (Type.list Type.string)
                    )
            }
        )
        [ routeToPathArg ]


{-| {-| . -}

baseUrl: String
-}
baseUrl : Elm.Expression
baseUrl =
    Elm.value
        { importFrom = [ "Route" ]
        , name = "baseUrl"
        , annotation = Just Type.string
        }


{-| {-| . -}

urlToRoute: { url | path : String } -> Maybe Route.Route
-}
urlToRoute : { url | path : String } -> Elm.Expression
urlToRoute urlToRouteArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "urlToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.extensible "url" [ ( "path", Type.string ) ] ]
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
        )
        [ Elm.record [ Tuple.pair "path" (Elm.string urlToRouteArg.path) ] ]


{-| {-| . -}

segmentsToRoute: List String -> Maybe Route.Route
-}
segmentsToRoute : List String -> Elm.Expression
segmentsToRoute segmentsToRouteArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "segmentsToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string ]
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
        )
        [ Elm.list (List.map Elm.string segmentsToRouteArg) ]


annotation_ : { route : Type.Annotation }
annotation_ =
    { route = Type.namedWith [ "Route" ] "Route" [] }


make_ :
    { blog__Post__Post_ : Elm.Expression -> Elm.Expression
    , cv : Elm.Expression
    , notFound : Elm.Expression
    , index : Elm.Expression
    , blog__Page__ : Elm.Expression -> Elm.Expression
    }
make_ =
    { blog__Post__Post_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Blog__Post__Post_"
                    , annotation = Just (Type.namedWith [] "Route" [])
                    }
                )
                [ ar0 ]
    , cv =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Cv"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , notFound =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "NotFound"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , index =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Index"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , blog__Page__ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Blog__Page__"
                    , annotation = Just (Type.namedWith [] "Route" [])
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { route :
        Elm.Expression
        -> { routeTags_0_0
            | blog__Post__Post_ : Elm.Expression -> Elm.Expression
            , cv : Elm.Expression
            , notFound : Elm.Expression
            , index : Elm.Expression
            , blog__Page__ : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { route =
        \routeExpression routeTags ->
            Elm.Case.custom
                routeExpression
                (Type.namedWith [ "Route" ] "Route" [])
                [ Elm.Case.branch1
                    "Blog__Post__Post_"
                    ( "one", Type.record [ ( "post", Type.string ) ] )
                    routeTags.blog__Post__Post_
                , Elm.Case.branch0 "Cv" routeTags.cv
                , Elm.Case.branch0 "NotFound" routeTags.notFound
                , Elm.Case.branch0 "Index" routeTags.index
                , Elm.Case.branch1
                    "Blog__Page__"
                    ( "one"
                    , Type.record [ ( "page", Type.maybe Type.string ) ]
                    )
                    routeTags.blog__Page__
                ]
    }


call_ :
    { withoutBaseUrl : Elm.Expression -> Elm.Expression
    , link :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , toLink : Elm.Expression -> Elm.Expression -> Elm.Expression
    , redirectTo : Elm.Expression -> Elm.Expression
    , toString : Elm.Expression -> Elm.Expression
    , toPath : Elm.Expression -> Elm.Expression
    , routeToPath : Elm.Expression -> Elm.Expression
    , urlToRoute : Elm.Expression -> Elm.Expression
    , segmentsToRoute : Elm.Expression -> Elm.Expression
    }
call_ =
    { withoutBaseUrl =
        \withoutBaseUrlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "withoutBaseUrl"
                    , annotation =
                        Just (Type.function [ Type.string ] Type.string)
                    }
                )
                [ withoutBaseUrlArg ]
    , link =
        \linkArg linkArg0 linkArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "link"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith [ "Route" ] "Route" []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ linkArg, linkArg0, linkArg1 ]
    , toLink =
        \toLinkArg toLinkArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "toLink"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.list
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
                                    ]
                                    (Type.var "abc")
                                , Type.namedWith [ "Route" ] "Route" []
                                ]
                                (Type.var "abc")
                            )
                    }
                )
                [ toLinkArg, toLinkArg0 ]
    , redirectTo =
        \redirectToArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "redirectTo"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Route" ] "Route" [] ]
                                (Type.namedWith
                                    [ "Server", "Response" ]
                                    "Response"
                                    [ Type.var "data", Type.var "error" ]
                                )
                            )
                    }
                )
                [ redirectToArg ]
    , toString =
        \toStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "toString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Route" ] "Route" [] ]
                                Type.string
                            )
                    }
                )
                [ toStringArg ]
    , toPath =
        \toPathArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "toPath"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Route" ] "Route" [] ]
                                (Type.namedWith [ "UrlPath" ] "UrlPath" [])
                            )
                    }
                )
                [ toPathArg ]
    , routeToPath =
        \routeToPathArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "routeToPath"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Route" ] "Route" [] ]
                                (Type.list Type.string)
                            )
                    }
                )
                [ routeToPathArg ]
    , urlToRoute =
        \urlToRouteArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "urlToRoute"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.extensible
                                    "url"
                                    [ ( "path", Type.string ) ]
                                ]
                                (Type.maybe
                                    (Type.namedWith [ "Route" ] "Route" [])
                                )
                            )
                    }
                )
                [ urlToRouteArg ]
    , segmentsToRoute =
        \segmentsToRouteArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "segmentsToRoute"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string ]
                                (Type.maybe
                                    (Type.namedWith [ "Route" ] "Route" [])
                                )
                            )
                    }
                )
                [ segmentsToRouteArg ]
    }


values_ :
    { withoutBaseUrl : Elm.Expression
    , link : Elm.Expression
    , toLink : Elm.Expression
    , redirectTo : Elm.Expression
    , toString : Elm.Expression
    , toPath : Elm.Expression
    , baseUrlAsPath : Elm.Expression
    , routeToPath : Elm.Expression
    , baseUrl : Elm.Expression
    , urlToRoute : Elm.Expression
    , segmentsToRoute : Elm.Expression
    }
values_ =
    { withoutBaseUrl =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "withoutBaseUrl"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , link =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "link"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , toLink =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.var "abc")
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.var "abc")
                    )
            }
    , redirectTo =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "redirectTo"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        (Type.namedWith
                            [ "Server", "Response" ]
                            "Response"
                            [ Type.var "data", Type.var "error" ]
                        )
                    )
            }
    , toString =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        Type.string
                    )
            }
    , toPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        (Type.namedWith [ "UrlPath" ] "UrlPath" [])
                    )
            }
    , baseUrlAsPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "baseUrlAsPath"
            , annotation = Just (Type.list Type.string)
            }
    , routeToPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "routeToPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        (Type.list Type.string)
                    )
            }
    , baseUrl =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "baseUrl"
            , annotation = Just Type.string
            }
    , urlToRoute =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "urlToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.extensible "url" [ ( "path", Type.string ) ] ]
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
    , segmentsToRoute =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "segmentsToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string ]
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
    }