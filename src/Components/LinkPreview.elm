module Components.LinkPreview exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Env
import BackendTask.Http
import BackendTask.Time
import Dict
import FatalError exposing (FatalError)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Parser exposing (Node)
import Svg.Attributes exposing (result)


type alias CardLinks =
    List ( String, List ( String, String ) )


getFirst : List (Maybe String) -> Maybe String
getFirst list =
    list
        |> List.filterMap identity
        |> List.head


render : CardLinks -> String -> List (Html msg) -> Html msg
render cardLinks url children =
    let
        dictCardLinks =
            Dict.fromList cardLinks

        dictMetaTags =
            case Dict.get url dictCardLinks of
                Just metaTags ->
                    Dict.fromList metaTags

                Nothing ->
                    Dict.empty

        --  ---"og:title"
        -- --"og:description"
        -- --"og:image"
        --  --"og:url"
        -- --"og:type"
        -- "twitter:card"
        -- --"twitter:title"
        -- -- "twitter:description"
        -- --"twitter:image"
        -- --"twitter:site"
        -- "article:author"
        -- "article:published_time"
        -- "og:video"
        --  --"description"
        tags =
            { title = getFirst [ Dict.get "og:title" dictMetaTags, Dict.get "twitter:title" dictMetaTags ]
            , url = getFirst [ Dict.get "og:url" dictMetaTags, Dict.get "twitter:site" dictMetaTags ]
            , type_ = Dict.get "og:type" dictMetaTags
            , description = getFirst [ Dict.get "og:description" dictMetaTags, Dict.get "twitter:description" dictMetaTags, Dict.get "description" dictMetaTags ]
            , image = getFirst [ Dict.get "og:image" dictMetaTags, Dict.get "twitter:image" dictMetaTags ]
            , author = Dict.get "article:author" dictMetaTags
            , publishedTime = Dict.get "article:published_time" dictMetaTags
            , video = Dict.get "og:video" dictMetaTags
            }
    in
    if Dict.isEmpty dictMetaTags then
        Html.a [ Attribute.href url ]
            (if List.isEmpty children then
                [ Html.text url ]

             else
                children
            )

    else
        Html.a
            [ Attribute.href url
            , Attribute.class "link-preview"
            , Attribute.style "text-decoration" "none"
            , Attribute.style "color" "inherit"
            , Attribute.style "margin" ".5rem"
            ]
            [ Html.node "style"
                []
                [ Html.text """
                        .link-preview .card {
                            box-sizing: border-box;
                            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
                            transition: box-shadow 100ms ease-in;
                        }
                        .link-preview .card:hover {
                            box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
                        }
                    """
                ]
            , Html.div
                [ Attribute.style "border-radius" "15px"
                , Attribute.style "display" "flex"
                , Attribute.style "flex-direction" "column"
                , Attribute.style "align-items" ""
                , Attribute.style "justifyContent" "center"
                , Attribute.style "width" "100%"
                , Attribute.style "flex" "1 0 100%"
                , Attribute.class "card"
                ]
                (List.filterMap
                    identity
                    [ tags.image
                        |> Maybe.map
                            (\img ->
                                Just
                                    (Html.div
                                        [ Attribute.style "height" "5rem"
                                        , Attribute.style "background" ("url(" ++ img ++ ") center center/cover no-repeat")
                                        , Attribute.style "border-radius" "15px 15px 0 0"
                                        ]
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
                                [ tags.title |> Maybe.map (\title -> Just (Html.h5 [ Attribute.style "margin" "0" ] [ Html.text title ])) |> Maybe.withDefault Nothing
                                , tags.description |> Maybe.map (\description -> Just (Html.p [ Attribute.style "margin" ".5rem 0" ] [ Html.text description ])) |> Maybe.withDefault Nothing
                                , tags.url |> Maybe.map (\url_ -> Just (Html.p [ Attribute.style "color" "slategrey", Attribute.style "margin" "0" ] [ Html.text url_ ])) |> Maybe.withDefault Nothing
                                ]
                            )
                        )
                    ]
                )
            ]
