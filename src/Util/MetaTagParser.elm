module Util.MetaTagParser exposing (extractMetaTags)

import Css exposing (content)
import Dict exposing (Dict)
import Html.Parser exposing (Node(..), runDocument)



-- Extract <meta> tags from an HTML string
-- Define the findAll function to find all nodes matching a predicate


findAll : (Node -> Bool) -> List Node -> List Node
findAll predicate nodes =
    List.concatMap
        (\node ->
            if predicate node then
                [ node ]

            else
                case node of
                    Element _ _ children ->
                        findAll predicate children

                    _ ->
                        []
        )
        nodes


extractMetaTags : String -> List ( String, String )
extractMetaTags html =
    let
        documentResult =
            String.trim html |> runDocument Html.Parser.allCharRefs
    in
    case documentResult of
        Ok document ->
            let
                nodes =
                    [ document.root ]

                headNodes =
                    nodes
                        |> findAll isHeadTag

                titles =
                    headNodes |> List.filterMap extractTitleFromHead |> List.map (\a -> ( "title", a ))

                metaTags =
                    headNodes |> List.concatMap extractMetaFromHead
            in
            titles ++ metaTags

        Err _ ->
            []



-- Check if a node is a <head> tag


isHeadTag : Node -> Bool
isHeadTag node =
    case node of
        Element "head" _ _ ->
            True

        _ ->
            False



-- Extract <meta> tags from a <head> node


extractTitleFromHead : Node -> Maybe String
extractTitleFromHead node =
    case node of
        Element "head" _ children ->
            children
                |> List.filterMap
                    (\child ->
                        case child of
                            Element "title" _ titleChildren ->
                                case titleChildren of
                                    [ Text content ] ->
                                        Just content

                                    _ ->
                                        Nothing

                            _ ->
                                Nothing
                    )
                |> List.head

        _ ->
            Nothing


extractMetaFromHead : Node -> List ( String, String )
extractMetaFromHead node =
    case node of
        Element "head" _ children ->
            children
                |> List.filter isMetaTag
                |> List.filter
                    (\meta ->
                        let
                            attributes =
                                extractAttributes meta
                        in
                        List.member (Dict.get "property" attributes |> Maybe.withDefault (Dict.get "name" attributes |> Maybe.withDefault ""))
                            [ "og:title"
                            , "og:description"
                            , "og:image"
                            , "og:url"
                            , "og:type"
                            , "twitter:card"
                            , "twitter:title"
                            , "twitter:description"
                            , "twitter:image"
                            , "twitter:site"
                            , "article:author"
                            , "article:published_time"
                            , "og:video"
                            , "description"
                            ]
                    )
                |> List.filterMap
                    (\meta ->
                        let
                            attributes =
                                extractAttributes meta

                            key =
                                Dict.get "property" attributes
                                    |> Maybe.withDefault (Dict.get "name" attributes |> Maybe.withDefault "")

                            content =
                                Dict.get "content" attributes
                        in
                        case content of
                            Just value ->
                                Just ( key, value )

                            Nothing ->
                                Nothing
                    )

        _ ->
            []



-- Check if a node is a <meta> tag


isMetaTag : Node -> Bool
isMetaTag node =
    case node of
        Element "meta" _ _ ->
            True

        _ ->
            False



-- Extract attributes from an Element


extractAttributes : Node -> Dict String String
extractAttributes node =
    case node of
        Element _ attributes _ ->
            Dict.fromList attributes

        _ ->
            Dict.empty
