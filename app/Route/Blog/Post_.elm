module Route.Blog.Post_ exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.File
import BackendTask.Glob as Glob
import Components.PostHeader as PostHeader
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attribute
import Json.Decode as Decode exposing (Decoder)
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer exposing (Renderer, defaultHtmlRenderer)
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Util.HTMLRender exposing (..)
import View exposing (View)


type alias BlogPost =
    { body : String
    , slug : String
    , title : String
    , cover : String
    , category : List String
    , tags : List String
    }


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


blogPosts : BackendTask FatalError (List BlogPost)
blogPosts =
    blogPostsGlob
        |> BackendTask.map (List.map (\blogPost -> BackendTask.File.bodyWithFrontmatter blogPostDecoder blogPost.filePath))
        |> BackendTask.resolve
        |> BackendTask.allowFatal


blogPostsToDict : BackendTask FatalError (List BlogPost) -> BackendTask FatalError (Dict String BlogPost)
blogPostsToDict blogPostList =
    blogPostList |> BackendTask.map (\list -> Dict.fromList (list |> List.map (\blogPost -> ( .slug blogPost, blogPost ))))


blogPostsGlob : BackendTask error (List { fileName : String, filePath : String })
blogPostsGlob =
    Glob.succeed
        (\filePath fileName ->
            { filePath = filePath
            , fileName = fileName
            }
        )
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "content/posts/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


blogPostDecoder : String -> Decoder BlogPost
blogPostDecoder body =
    Decode.map5 (BlogPost body)
        (Decode.field "slug" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "cover" Decode.string)
        (Decode.field "category" <| Decode.list <| Decode.string)
        (Decode.field "tags" <| Decode.list <| Decode.string)


processHtml : Markdown.Html.Renderer (List (Html msg) -> Html msg)
processHtml =
    Markdown.Html.oneOf
        [ Markdown.Html.tag "div"
            showDiv
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "span"
            showSpan
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "b" (Html.b [])
        , Markdown.Html.tag "em" (\class children -> Html.em [ Attribute.class (Maybe.withDefault "" class) ] children) |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "p" (\children -> Html.p [] children)
        , Markdown.Html.tag "blockquote" showBlockquote |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "script" (\children -> Html.div [] children)
        , Markdown.Html.tag "a" showLink |> Markdown.Html.withOptionalAttribute "href" |> Markdown.Html.withOptionalAttribute "id" |> Markdown.Html.withOptionalAttribute "target" |> Markdown.Html.withOptionalAttribute "rel"
        , Markdown.Html.tag "iframe"
            showIframe
            |> Markdown.Html.withAttribute "src"
            |> Markdown.Html.withOptionalAttribute "width"
            |> Markdown.Html.withOptionalAttribute "height"
            |> Markdown.Html.withOptionalAttribute "allow"
            |> Markdown.Html.withOptionalAttribute "scrolling"
            |> Markdown.Html.withOptionalAttribute "frameborder"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "title"
        , Markdown.Html.tag "h1"
            (showHeading 1)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h2"
            (showHeading 2)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h3"
            (showHeading 3)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h4"
            (showHeading 4)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h5"
            (showHeading 5)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h6"
            (showHeading 6)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "table"
            showTable
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "thead"
            showTableHead
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "tbody"
            showTableBody
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "th"
            showTableHeader
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "colspan"
        , Markdown.Html.tag "tr"
            showTableRow
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "td"
            showTableData
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "colspan"
        , Markdown.Html.tag "i" (Html.i [])
        , Markdown.Html.tag "strong" (\children -> Html.span [] [ Html.strong [] children ])
        , Markdown.Html.tag "br" (Html.br [])
        , Markdown.Html.tag "li" (\id children -> Html.li [ Attribute.id (Maybe.withDefault "" id) ] children) |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "ol" (Html.ol [])
        , Markdown.Html.tag "ul" (Html.ul [])
        , Markdown.Html.tag "code" showCodeBlock |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "img" showImage
            |> Markdown.Html.withOptionalAttribute "alt"
            |> Markdown.Html.withOptionalAttribute "title"
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withAttribute "src"
        , Markdown.Html.tag "dl" showDefinitionList
        , Markdown.Html.tag "dd" showDefinitionDescription
        , Markdown.Html.tag "dt" showDefinitionTerm |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "figure" (Html.figure [])
        , Markdown.Html.tag "figcaption" (Html.figcaption [])
        , Markdown.Html.tag "hr" (Html.hr [])
        , Markdown.Html.tag "label" (Html.label [])
        , Markdown.Html.tag "easy-like-score" showEasyLikeScore
            |> Markdown.Html.withAttribute "likeness"
            |> Markdown.Html.withAttribute "easiness"
        , Markdown.Html.tag "warning" warningBox
        ]


customHtmlRenderer : Renderer (Html msg)
customHtmlRenderer =
    { defaultHtmlRenderer
        | image = \{ alt, src, title } -> showImage (Just alt) title Nothing Nothing src []
        , codeBlock = codeBlock
        , html = processHtml
    }



-- Markdown.Html.oneOf
--     [ Markdown.Html.tag "b" (Html.b [])
--     , Markdown.Html.tag "blockquote" (Html.blockquote [] )
--     , Markdown.Html.tag "p" (Html.p [])
--     , Markdown.Html.tag "a" (Html.a [])
--     , Markdown.Html.tag "span" (Html.span [])
--     , Markdown.Html.tag "div" (Html.div [])
--     , Markdown.Html.tag "iframe" (Html.iframe [])
--     ]


markdownToView : String -> List (Html msg)
markdownToView markdownString =
    markdownString
        |> Markdown.Parser.parse
        |> Result.mapError (\error -> error |> List.map Markdown.Parser.deadEndToString |> String.join "\n")
        |> Result.andThen
            (\blocks ->
                Markdown.Renderer.render
                    customHtmlRenderer
                    blocks
            )
        |> (\result ->
                case result of
                    Ok markdown ->
                        markdown

                    Err error ->
                        let
                            _ =
                                Debug.log "Error" error
                        in
                        [ Html.text "There was an error parsing the Markdown", Html.text error ]
           )


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
                                BlogPost "" "" "" "" [] []
                    )
    in
    BackendTask.map Data blogPostFound


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = "TODO title" -- metadata.title -- TODO
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app sharedModel =
    let
        { title, cover, tags, category, body } =
            app.data.blogPost

        _ =
            Debug.log "title" app.data.blogPost.title

        _ =
            Debug.log "cover" app.data.blogPost.cover

        _ =
            Debug.log "tags" app.data.blogPost.tags

        _ =
            Debug.log "category" app.data.blogPost.category

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
      body = PostHeader.show title cover tags category :: markdownToView body

    --  , body = [ Html.text "You're on the page Blog.Post_", ExplorationsMarkdown.toHtmlWith { githubFlavored = Just { tables = True, breaks = False }, defaultHighlighting = Just "elm", sanitize = True, smartypants = False } [] body ]
    }
