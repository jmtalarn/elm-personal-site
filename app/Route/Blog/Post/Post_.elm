module Route.Blog.Post.Post_ exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Components.Blog.PostHeader as PostHeader
import Components.Ribbon exposing (..)
import DataModel.BlogPosts exposing (..)
import Date
import DateOrDateTime
import Dict
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attribute
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Time
import UrlPath
import Util.MarkdownProcessor as MarkdownProcessor exposing (getAbstract, markdownToText)
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { post : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


pages : BackendTask FatalError (List RouteParams)
pages =
    blogPosts
        |> BackendTask.map (List.map blogPost2RouteParams)


blogPost2RouteParams : BlogPost -> RouteParams
blogPost2RouteParams { slug } =
    RouteParams slug


type alias Data =
    { blogPost : BlogPost
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data { post } =
    let
        blogPostFound =
            blogPostsToDict blogPosts
                |> BackendTask.map
                    (\dict ->
                        case Dict.get post dict of
                            Just blogpost ->
                                blogpost

                            Nothing ->
                                BlogPost "" "" "" "" [] [] (Date.fromCalendarDate 2000 Time.Jan 1)
                    )
    in
    BackendTask.map Data blogPostFound


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    let
        { title, cover, body, tags, category, date } =
            app.data.blogPost
    in
    Seo.summaryLarge
        { canonicalUrlOverride = Nothing
        , siteName = "Web dev notes - jmtalarn blog"
        , image =
            { url = cover |> UrlPath.fromString |> Pages.Url.fromPath
            , alt = title
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = markdownToText (getAbstract body)
        , locale = Nothing
        , title = title
        }
        |> Seo.article
            { tags = tags
            , section = Just (String.join " " category)
            , publishedTime = Just (DateOrDateTime.Date date)
            , modifiedTime = Nothing
            , expirationTime = Nothing
            }


blogPostStyle : Html msg
blogPostStyle =
    Html.node "style"
        []
        [ Html.text """
            .blog-post {
                padding: 0 1rem;
                max-width: 960px;
                margin: 0 auto;
            }
            .blog-post p {
                text-align: justify;
            }
            .blog-post iframe {
                max-width: 100%;
            }
            .blog-post img {
                margin-bottom: 1rem"
            }
            .blog-post figcaption {
                font-weight: 100;
                font-style: oblique;
            }
        """
        ]


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app sharedModel =
    let
        { title, cover, tags, category, body, date } =
            app.data.blogPost
    in
    { title = app.data.blogPost.title ++ " 🗒️ web dev notes"
    , body =
        [ blogPostStyle
        , Html.div
            [ Attribute.style "box-shadow" "0 0 15px rgba(0,0,0,.1)"
            , Attribute.style "padding" "0rem 1rem 1rem 1rem"
            , Attribute.style "margin" "2rem auto"
            , Attribute.style "max-width" "960px"
            , Attribute.style "position" "relative"
            ]
            [ PostHeader.show title cover tags category date
            , Html.article [ Attribute.class "blog-post" ] (MarkdownProcessor.markdownToView body)
            , ribbonReverse "Blog post"
            ]
        ]
    }
