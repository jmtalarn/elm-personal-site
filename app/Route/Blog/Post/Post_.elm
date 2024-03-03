module Route.Blog.Post.Post_ exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Components.PostHeader as PostHeader
import DataModel.BlogPosts exposing (..)
import Date
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
import Util.MarkdownProcessor as MarkdownProcessor
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



-- BackendTask.succeed
-- [ { post = "hello2" }
-- , { post = "hello" }
-- ]
-- Markdown.Html.oneOf
--     [ Markdown.Html.tag "b" (Html.b [])
--     , Markdown.Html.tag "blockquote" (Html.blockquote [] )
--     , Markdown.Html.tag "p" (Html.p [])
--     , Markdown.Html.tag "a" (Html.a [])
--     , Markdown.Html.tag "span" (Html.span [])
--     , Markdown.Html.tag "div" (Html.div [])
--     , Markdown.Html.tag "iframe" (Html.iframe [])
--     ]


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
        { title, cover } =
            app.data.blogPost
    in
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Web dev notes - jmtalarn blog"
        , image =
            { url = Pages.Url.external cover
            , alt = title
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = title
        }
        |> Seo.website


blogPostStyle : Html msg
blogPostStyle =
    Html.node "style"
        []
        [ Html.text ".blog-post {"
        , Html.text "    padding: 0 1rem;"
        , Html.text "    max-width: 960px;"
        , Html.text "    margin: 0 auto;"
        , Html.text "}"
        , Html.text ".blog-post p {"
        , Html.text "    text-align: justify;"
        , Html.text "}"
        , Html.text ".blog-post iframe {"
        , Html.text "   max-width: 100%;"
        , Html.text "}"
        , Html.text ".blog-post img {"
        , Html.text "   margin-bottom: 1rem"
        , Html.text "}"
        , Html.text ".blog-post figcaption {"
        , Html.text "   font-weight: 100;"
        , Html.text "   font-style: oblique;"
        , Html.text "}"
        ]


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app sharedModel =
    let
        { title, cover, tags, category, body, date } =
            app.data.blogPost

        _ =
            Debug.log "title" title

        _ =
            Debug.log "cover" cover

        _ =
            Debug.log "tags" tags

        _ =
            Debug.log "category" category

        _ =
            Debug.log "date" date

        -- markdownOptions =
        --     { githubFlavored = Just { tables = False, breaks = False }
        --     , defaultHighlighting = Nothing
        --     , sanitize = False
        --     , smartypants = False
        --    }
    in
    { title = app.data.blogPost.title ++ " 🗒️ web dev notes"
    , -- , body = [ Html.text "You're on the page Blog.Post_"
      --     , EMarkdown.toHtmlWith markdownOptions [] body ] ++ markdownToView body
      body =
        [ blogPostStyle
        , PostHeader.show title cover tags category date
        , Html.article [ Attribute.class "blog-post" ] (MarkdownProcessor.markdownToView body)
        ]

    --  , body = [ Html.text "You're on the page Blog.Post_", ExplorationsMarkdown.toHtmlWith { githubFlavored = Just { tables = True, breaks = False }, defaultHighlighting = Just "elm", sanitize = True, smartypants = False } [] body ]
    }
