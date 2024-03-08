module Components.Blog.Pagination exposing (..)

import Browser
import Components.Icon as Icon
import DataModel.BlogPosts exposing (BlogPost)
import Date
import Effect exposing (Effect)
import ErrorPage exposing (Msg)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Phosphor
import Route


paginationStyle : Html msg
paginationStyle =
    Html.node
        "style"
        []
        [ Html.text """
            .posts-pagination {
                display: flex;
                align-items: center;
                justify-content: space-evenly;
                margin: 2rem auto;
            }
            .posts-pagination .page {
                width: 2rem;
                height: 2rem;
                line-height: 2rem;
                text-align: center;
                border-radius: 50%;
                border: 1px solid transparent;
                transition: all 300ms ease-out;
            }
            .posts-pagination .current-page {
                border: 1px solid CornflowerBlue;
            }
            .posts-pagination a {
                text-decoration: none;
                
            }
            .posts-pagination .page:not(.current-page):hover {
                background-color: CornflowerBlue;
                border: 1px solid Indigo;
            }
        """ ]


pagination : Int -> Int -> Html msg
pagination currentPage numberOfPages =
    Html.div [ Attribute.class "posts-pagination" ]
        ([ paginationStyle
         , Html.span
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            ]
            [ Html.text "Page"
            , Icon.duotone
                Phosphor.bookOpenText
                (Just
                    [ Attribute.style "font-size" "2rem"
                    , Attribute.style "color" "CornflowerBlue"
                    ]
                )
            ]
         ]
            ++ List.map
                (\number ->
                    if number == currentPage then
                        Html.div
                            [ Attribute.class "current-page"
                            , Attribute.class "page"
                            , Attribute.style "weight" "900"
                            ]
                            [ Html.text (String.fromInt number) ]

                    else
                        Route.Blog__Page__ { page = Just (String.fromInt number) }
                            |> Route.link
                                [ Attribute.class "page-link"
                                , Attribute.class "page"
                                ]
                                [ Html.div [] [ Html.text (String.fromInt number) ] ]
                )
                (List.range 1 numberOfPages)
        )
