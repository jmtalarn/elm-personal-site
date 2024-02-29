module Components.BlogPostCard exposing (..)

-- https://elmprogramming.com/commands.html#wiring-everything-up Sandbox

import Browser
import DataModel.BlogPosts exposing (BlogPost)
import Date
import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
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
                transition: box-shadow 300ms ease-in;
            }
            .blog-post-card:hover {
                box-shadow: 0 8px 16px 8px rgba(0, 0, 0, 0.2);
            }
        """ ]


blogPostCardHeaderStyle : String -> List (Html.Attribute msg)
blogPostCardHeaderStyle cover =
    [ Attribute.style
        "background-image"
        ("""linear-gradient(
                rgba(0, 0, 0, 0.7), 
                rgba(0, 0, 0, 0.7)
            ),
            url(\""""
            ++ cover
            ++ """")"""
        )
    , Attribute.style "background-repeat" "no-repeat"
    , Attribute.style "background-position" "center"
    , Attribute.style "background-size" "cover"
    , Attribute.style "border-radius" "10px 10px 0 0"
    , Attribute.style "padding" "1rem"
    , Attribute.style "color" "white"
    , Attribute.style "text-shadow" "2px 2px 2px black"
    ]


whiteLinksStyle : List (Html.Attribute msg)
whiteLinksStyle =
    [ Attribute.style "text-decoration" "none"
    , Attribute.style "color" "inherit"
    ]


blogPostCardContentStyle : List (Html.Attribute msg)
blogPostCardContentStyle =
    [ Attribute.style "padding" "1rem" ]


getAbstract : String -> String
getAbstract body =
    Maybe.withDefault "" <| List.head (String.split "<!--more-->" body)


blogPostCard : BlogPost -> Html msg
blogPostCard { title, slug, date, cover, body } =
    Html.article
        [ Attribute.class "blog-post-card" ]
        [ blogPostCardStyle
        , Html.header
            (blogPostCardHeaderStyle cover)
            [ Route.Blog__Post_ { post = slug }
                |> Route.link whiteLinksStyle
                    [ Html.h3 [ Attribute.style "margin" "0" ] [ Html.text title ]
                    , Html.div
                        [ Attribute.style "display" "flex"
                        , Attribute.style "align-items" "center"
                        , Attribute.style "justify-content" "flex-end"
                        ]
                        [ Html.span
                            [ Attribute.style "font-size" "0.6rem" ]
                            [ Html.text ("📅 " ++ Date.format "d, MMMM y" date) ]
                        ]
                    ]
            ]
        , Html.div
            blogPostCardContentStyle
            [ Html.p [] (MarkdownProcessor.markdownToText (getAbstract body)) ]
        ]
