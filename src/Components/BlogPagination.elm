module Components.BlogPagination exposing (..)

import Browser
import DataModel.BlogPosts exposing (BlogPost)
import Date
import Effect exposing (Effect)
import ErrorPage exposing (Msg)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Route


paginationStyle : List (Html.Attribute msg)
paginationStyle =
    [ Attribute.style "display" "flex"
    , Attribute.style "align-items" "center"
    , Attribute.style "justify-content" "space-evenly"
    , Attribute.style "margin" "2rem auto"
    ]


pagination : Int -> Int -> Html msg
pagination currentPage numberOfPages =
    Html.div paginationStyle
        (List.map
            (\number ->
                if number == currentPage then
                    Html.div [ Attribute.style "weight" "900" ] [ Html.text (String.fromInt number) ]

                else
                    Route.Blog__Page__ { page = Just (String.fromInt number) }
                        |> Route.link [] [ Html.div [] [ Html.text (String.fromInt number) ] ]
            )
            (List.range 1 numberOfPages)
        )
