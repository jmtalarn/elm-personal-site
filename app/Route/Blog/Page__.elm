module Route.Blog.Page__ exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Components.Blog.Pagination exposing (pagination)
import Components.Blog.PostCard exposing (blogPostCard)
import Components.Ribbon exposing (..)
import DataModel.BlogPosts exposing (..)
import Date
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attribute
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { page : Maybe String }


type alias Data =
    { posts : List BlogPost
    , page : Int
    , totalPages : Int
    }


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


pageSize : Int
pageSize =
    6


pages : BackendTask FatalError (List RouteParams)
pages =
    blogPosts
        |> BackendTask.map
            (\list ->
                List.range 0 (ceiling (toFloat (List.length list) / toFloat pageSize))
                    |> List.map
                        (\n ->
                            if n == 0 then
                                { page = Nothing }

                            else
                                { page = Just (String.fromInt n) }
                        )
            )


data : RouteParams -> BackendTask FatalError Data
data { page } =
    let
        pageNumber =
            Maybe.withDefault 1 <|
                String.toInt <|
                    Maybe.withDefault "" page

        totalPages =
            blogPosts
                |> BackendTask.map
                    (\list ->
                        ceiling (toFloat (List.length list) / toFloat pageSize)
                    )
    in
    BackendTask.map3 Data
        (blogPosts
            |> BackendTask.map
                (\posts ->
                    sortPosts posts
                        |> List.drop ((pageNumber - 1) * pageSize)
                        |> List.take pageSize
                )
        )
        (BackendTask.succeed pageNumber)
        totalPages


title : String
title =
    "jmtalarn.com ~ web dev notes blog"


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = title
        , image =
            { url = [ "images", "home", "openart-image_Ko4Z9KtJ_1712956581329_raw.jpg" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "jmtalarn an AI generated image to illustrate my blog, web dev notes"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Web Dev Notes, this is my blog. This is the paginated blog post list, concretely the page number " ++ String.fromInt app.data.page ++ "."
        , locale = Nothing
        , title = title
        }
        |> Seo.website


blogPostGridStyle : List (Html.Attribute msg)
blogPostGridStyle =
    [ Attribute.style "column-count" "auto"
    , Attribute.style "column-gap" "5px"
    , Attribute.style "column-width" "25rem"
    ]


sortPosts : List BlogPost -> List BlogPost
sortPosts posts =
    List.sortWith
        (\a b ->
            case compare (Date.toRataDie a.date) (Date.toRataDie b.date) of
                LT ->
                    GT

                EQ ->
                    EQ

                GT ->
                    LT
        )
        posts


antonFontAttributeStyle : List (Html.Attribute msg)
antonFontAttributeStyle =
    [ Attribute.style "font-family" "\"Anton\", sans-serif"
    , Attribute.style "font-weight" "400"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "3rem"
    , Attribute.style "line-height" "3rem"
    ]


workSansAttributeStyle : List (Html.Attribute msg)
workSansAttributeStyle =
    [ Attribute.style "font-family" "\"Work Sans\", sans-serif"
    , Attribute.style "font-optical-sizing" "auto"
    , Attribute.style "font-weight" "300"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "3rem"
    , Attribute.style "line-height" "2"
    ]


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    let
        blogPosts =
            app.data.posts

        page =
            app.data.page

        totalPages =
            app.data.totalPages
    in
    { title = title
    , body =
        [ Html.div
            [ Attribute.style "box-shadow" "0 0 15px rgba(0,0,0,.1)"
            , Attribute.style "padding" "1rem"
            , Attribute.style "margin" "2rem auto"
            , Attribute.style "position" "relative"
            , Attribute.style "max-width" "1024px"
            ]
            [ Html.h2
                [ Attribute.style "margin-left" "4rem" ]
                [ Html.span antonFontAttributeStyle
                    [ Html.text "Web dev notes" ]
                , Html.span workSansAttributeStyle
                    [ Html.text " blog" ]
                ]
            , pagination page totalPages
            , Html.div blogPostGridStyle (List.map blogPostCard blogPosts)
            , pagination page totalPages
            , ribbon "blog"
            ]
        ]
    }
