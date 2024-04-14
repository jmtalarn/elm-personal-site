module Components.Blog.PostCard exposing (..)

-- https://elmprogramming.com/commands.html#wiring-everything-up Sandbox

import Components.Icons.Icon as Icon
import DataModel.BlogPosts exposing (BlogPost)
import Date
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor
import Route
import Util.MarkdownProcessor as MarkdownProcessor


blogPostCardStyle : Html msg
blogPostCardStyle =
    Html.node
        "style"
        []
        [ Html.text """
            .blog-post-card {
                display: flex;
                flex-direction: column;
                margin: 1rem;
                border-radius: 10px;
                box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
                transition: box-shadow 100ms ease-in;
                break-inside: avoid-column;
            }
            .blog-post-card:hover {
                box-shadow: 0 8px 16px 8px rgba(0, 0, 0, 0.2);
            }
        """ ]



-- blogPostCardHeaderStyle : String -> List (Html.Attribute msg)
-- blogPostCardHeaderStyle cover =
--     [ Attribute.style
--         "background-image"
--         ("""linear-gradient(
--                 rgba(0, 0, 0, 0.7),
--                 rgba(0, 0, 0, 0.7)
--             ),
--             url(\""""
--             ++ cover
--             ++ """")"""
--         )
--     , Attribute.style "background-repeat" "no-repeat"
--     , Attribute.style "background-position" "center"
--     , Attribute.style "background-size" "cover"
--     , Attribute.style "border-radius" "10px 10px 0 0"
--     , Attribute.style "padding" "1rem"
--     , Attribute.style "color" "white"
--     , Attribute.style "text-shadow" "2px 2px 2px black"
--     ]


whiteLinksStyle : List (Html.Attribute msg)
whiteLinksStyle =
    [ Attribute.style "text-decoration" "none"
    , Attribute.style "color" "inherit"
    ]


taggedContentStyle : List (Html.Attribute msg)
taggedContentStyle =
    [ Attribute.style "font-size" "0.8rem"
    , Attribute.style "margin" "0.5rem 1rem"
    , Attribute.style "display" "flex"
    , Attribute.style "aling-items" "center"
    , Attribute.style "gap" ".4rem"
    , Attribute.style "flex-wrap" "wrap"
    ]


blogPostCardContentStyle : List (Html.Attribute msg)
blogPostCardContentStyle =
    [ Attribute.style "text-align" "justify"
    , Attribute.style "font-size" ".8rem"
    , Attribute.style "margin" "0 1rem "
    ]


getAbstract : String -> String
getAbstract body =
    Maybe.withDefault "" <| List.head (String.split "<!--more-->" body)


headerImageStyle : List (Html.Attribute msg)
headerImageStyle =
    [ Attribute.style "width" "100%"
    , Attribute.style "border-radius" "10px 10px 0 0"
    ]


iconSizeStyle : List (Html.Attribute msg)
iconSizeStyle =
    [ Attribute.style "min-width" "1.2rem"
    , Attribute.style "max-width" "1.2rem"
    ]


blogPostCard : BlogPost -> Html msg
blogPostCard { title, slug, date, cover, body, tags, category } =
    Html.article
        [ Attribute.class "blog-post-card" ]
        [ blogPostCardStyle
        , Html.header
            []
            [ Html.img (Attribute.src cover :: headerImageStyle) []
            , Html.div taggedContentStyle
                [ Icon.light Phosphor.folderOpen (Just iconSizeStyle)
                , Html.text (String.join ", " category)
                ]
            , Route.Blog__Post__Post_ { post = slug }
                |> Route.link whiteLinksStyle
                    [ Html.h3 [ Attribute.style "margin" "0 1rem" ] [ Html.text title ]
                    ]
            ]
        , Html.div
            blogPostCardContentStyle
            [ Html.p [] [ Html.text (MarkdownProcessor.markdownToText (getAbstract body)) ] ]
        , Html.footer []
            [ Html.div taggedContentStyle
                (List.map
                    (\tag ->
                        Html.span
                            [ Attribute.style "display" "flex"
                            , Attribute.style "align-items" "center"
                            , Attribute.style "gap" "3px"
                            ]
                            [ Icon.fill Phosphor.tag (Just [ Attribute.style "color" "Orange", Attribute.style "font-size" "1rem" ])
                            , Html.text tag
                            ]
                    )
                    tags
                )
            , Html.div
                [ Attribute.style "display" "flex"
                , Attribute.style "align-items" "center"
                , Attribute.style "justify-content" "flex-start"
                ]
                [ Html.span
                    taggedContentStyle
                    [ Icon.light Phosphor.calendar (Just iconSizeStyle)
                    , Html.text (Date.format "d, MMMM y" date)
                    ]
                ]
            ]
        ]
