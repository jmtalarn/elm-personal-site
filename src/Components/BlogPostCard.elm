module Components.BlogPostCard exposing (..)

import DataModel.BlogPosts exposing (BlogPost)
import Date
import Html exposing (Html)
import Html.Attributes as Attribute
import Route


blogPostCardStyle : List (Html.Attribute msg)
blogPostCardStyle =
    [ Attribute.style "display" "flex"
    , Attribute.style "flex-direction" "column"
    , Attribute.style "margin" "1rem"
    , Attribute.style "padding" "1rem"
    , Attribute.style "border" "1px solid grey"
    , Attribute.style "border-radius" "10px"
    ]


blogPostCard : BlogPost -> Html msg
blogPostCard { title, slug, date, cover } =
    Html.li
        blogPostCardStyle
        [ Route.Blog__Post_ { post = slug } |> Route.link [] [ Html.text title ]
        , Html.span [ Attribute.style "font-size" ".8rem" ] [ Html.text ("📅 " ++ Date.format "d, MMMM y" date) ]
        , Html.img [ Attribute.src cover ] []
        ]
