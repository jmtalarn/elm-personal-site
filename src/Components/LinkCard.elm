module Components.LinkCard exposing (..)

import BackendTask exposing (BackendTask)
import Dict
import FatalError exposing (FatalError)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Parser exposing (Node)
import Svg.Attributes exposing (result)


type alias CardLinks =
    List ( String, List ( String, String ) )


type ImagePosition
    = Top
    | Left
    | Right


getFirst : List (Maybe String) -> Maybe String
getFirst list =
    list
        |> List.filterMap identity
        |> List.head


render : CardLinks -> ImagePosition -> String -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
render cardLinks imagePosition url attributes children =
    let
        baseUrl =
            String.split "?" url
                |> List.head
                |> Maybe.withDefault ""
                |> (\base ->
                        if String.endsWith "/" base then
                            String.dropRight 1 base

                        else
                            base
                   )

        isGitHubIo =
            String.contains "github.io" baseUrl

        dictCardLinks =
            Dict.fromList cardLinks

        dictMetaTags =
            case Dict.get url dictCardLinks of
                Just metaTags ->
                    Dict.fromList metaTags

                Nothing ->
                    Dict.empty

        -- "title"
        -- --"og:title"
        -- --"twitter:title"
        -- --"og:image"
        -- --"twitter:image"
        -- --"og:type"
        -- "twitter:card"
        --  --"og:url"
        -- --"twitter:site"
        -- "article:author"
        -- "article:published_time"
        -- --"og:description"
        --  --"description"
        -- -- "twitter:description"
        -- "og:video"
        tags =
            { title = getFirst [ Dict.get "og:title" dictMetaTags, Dict.get "title" dictMetaTags, Dict.get "twitter:title" dictMetaTags ]
            , url = getFirst [ Dict.get "og:url" dictMetaTags, Just url ] --Dict.get "twitter:site" dictMetaTags,
            , type_ = Dict.get "og:type" dictMetaTags
            , description = getFirst [ Dict.get "og:description" dictMetaTags, Dict.get "twitter:description" dictMetaTags, Dict.get "description" dictMetaTags ]
            , image =
                getFirst
                    ([ Dict.get "og:image" dictMetaTags, Dict.get "twitter:image" dictMetaTags ]
                        ++ ([ Dict.get "apple-touch-icon" dictMetaTags, Dict.get "icon" dictMetaTags, Dict.get "mask-icon" dictMetaTags, Dict.get "shortcut icon" dictMetaTags ]
                                |> List.map
                                    (Maybe.map
                                        (\img ->
                                            let
                                                img_ =
                                                    if isGitHubIo then
                                                        String.split "/" img
                                                            |> List.drop 2
                                                            |> String.join "/"
                                                            |> String.append "/"

                                                    else
                                                        img
                                            in
                                            if String.startsWith "/" img_ then
                                                baseUrl ++ img_

                                            else
                                                baseUrl ++ "/" ++ img_
                                        )
                                    )
                           )
                    )
            , author = Dict.get "article:author" dictMetaTags
            , publishedTime = Dict.get "article:published_time" dictMetaTags
            , video = Dict.get "og:video" dictMetaTags
            }
    in
    if Dict.isEmpty dictMetaTags then
        Html.a (Attribute.href url :: attributes)
            (if List.isEmpty children then
                [ Html.text url ]

             else
                children
            )

    else
        Html.a
            [ Attribute.href url
            , Attribute.class "link-card"
            , Attribute.style "text-decoration" "none"
            , Attribute.style "color" "inherit"
            , Attribute.style "margin" ".5rem"
            ]
            [ Html.node "style"
                []
                [ Html.text """
                        .link-card .card {
                            box-sizing: border-box;
                            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
                            transition: box-shadow 100ms ease-in;
                        }
                        .link-card .card:hover {
                            box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
                        }
                    """
                ]
            , Html.div
                ([ Attribute.style "border-radius" "15px"
                 , Attribute.style "display" "flex"
                 , Attribute.style "flex-direction"
                    (case imagePosition of
                        Top ->
                            "column"

                        Left ->
                            "row"

                        Right ->
                            "row-reverse"
                    )
                 , Attribute.style "justifyContent" "space-between"
                 , Attribute.style "width" "100%"
                 , Attribute.style "flex" "1 0 100%"
                 , Attribute.class "card"
                 ]
                    ++ attributes
                )
                (List.filterMap
                    identity
                    [ tags.image
                        |> Maybe.map
                            (\img ->
                                Just
                                    (Html.div
                                        ((case imagePosition of
                                            Top ->
                                                [ Attribute.style "height" "5rem"
                                                , Attribute.style "border-radius" "15px 15px 0 0"
                                                ]

                                            Left ->
                                                [ Attribute.style "width" "40%"
                                                , Attribute.style "min-width" "8rem"
                                                , Attribute.style "border-radius" "15px 0 0 15px"
                                                ]

                                            Right ->
                                                [ Attribute.style "width" "40%"
                                                , Attribute.style "min-width" "8rem"
                                                , Attribute.style "border-radius" "0 15px 15px 0"
                                                ]
                                         )
                                            ++ [ Attribute.style "background"
                                                    ("url(" ++ img ++ ") center center/contain no-repeat")
                                               ]
                                        )
                                        []
                                    )
                            )
                        |> Maybe.withDefault Nothing
                    , Just
                        (Html.div
                            [ Attribute.style "padding" "1rem"
                            , Attribute.style "font-size" ".8rem"
                            ]
                            (List.filterMap
                                identity
                                ([ tags.title |> Maybe.map (\title -> Just (Html.h5 [ Attribute.style "font-size" ".8rem", Attribute.style "margin" "0" ] [ Html.text title ])) |> Maybe.withDefault Nothing
                                 , tags.description |> Maybe.map (\description -> Just (Html.p [ Attribute.style "margin" ".5rem 0" ] [ Html.text description ])) |> Maybe.withDefault Nothing
                                 ]
                                    ++ List.map (\a -> Just a) children
                                    ++ [ case ( tags.author, tags.publishedTime ) of
                                            ( Nothing, Nothing ) ->
                                                Nothing

                                            _ ->
                                                Just
                                                    (Html.div
                                                        [ Attribute.style "font-size" ".6rem"
                                                        , Attribute.style "color" "slategrey"
                                                        , Attribute.style "text-transform" "uppercase"
                                                        , Attribute.style "display" "flex"
                                                        , Attribute.style "aling-items" "center"
                                                        , Attribute.style "justify-content" "space-between"
                                                        ]
                                                        [ Html.span []
                                                            (case tags.author of
                                                                Just a ->
                                                                    [ Html.text a ]

                                                                _ ->
                                                                    []
                                                            )
                                                        , Html.span []
                                                            (case tags.publishedTime of
                                                                Just a ->
                                                                    [ Html.text a ]

                                                                _ ->
                                                                    []
                                                            )
                                                        ]
                                                    )
                                       , tags.url |> Maybe.map (\url_ -> Just (Html.p [ Attribute.style "color" "slategrey", Attribute.style "margin" "0" ] [ Html.text url_ ])) |> Maybe.withDefault Nothing
                                       ]
                                )
                            )
                        )
                    ]
                )
            ]
