module Route.Blog.Post_ exposing (ActionData, Data, Model, Msg, route)

import Array
import BackendTask exposing (BackendTask)
import BackendTask.File
import BackendTask.Glob as Glob
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
import View exposing (View)


type alias BlogPost =
    { body : String
    , slug : String
    , title : String
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
    Decode.map2 (BlogPost body)
        (Decode.field "slug" Decode.string)
        (Decode.field "title" Decode.string)


processStyleAttribute : String -> List (Html.Attribute msg)
processStyleAttribute styleString =
    let
        lines =
            String.split ";" styleString |> List.map String.trim |> List.map (\value -> Array.fromList (String.split ":" value |> List.map String.trim))
    in
    List.map (\pair -> Attribute.style (Maybe.withDefault "" (Array.get 0 pair)) (Maybe.withDefault "" (Array.get 1 pair))) lines


processHtml : Markdown.Html.Renderer (List (Html msg) -> Html msg)
processHtml =
    let
        showDiv : Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showDiv class style id children =
            Html.div
                ([ Attribute.class (Maybe.withDefault "" class)
                 , Attribute.id (Maybe.withDefault "" id)
                 ]
                    ++ processStyleAttribute (Maybe.withDefault "" style)
                )
                children

        showSpan : Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showSpan class id children =
            Html.span
                [ Attribute.class (Maybe.withDefault "" class)
                , Attribute.id (Maybe.withDefault "" id)
                ]
                children

        showIframe : String -> Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showIframe src width height allow _ =
            Html.iframe
                (Attribute.src src
                    :: (case allow of
                            Just value ->
                                [ Attribute.attribute "allow" value ]

                            Nothing ->
                                []
                       )
                    ++ (case width of
                            Just a_width ->
                                [ Attribute.width <| Maybe.withDefault 100 <| String.toInt a_width ]

                            Nothing ->
                                []
                       )
                    ++ (case height of
                            Just a_height ->
                                [ Attribute.height <| Maybe.withDefault 100 <| String.toInt a_height ]

                            Nothing ->
                                []
                       )
                )
                []

        showLink : Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showLink href id children =
            Html.a
                ([]
                    ++ (case href of
                            Just hrefValue ->
                                [ Attribute.href hrefValue ]

                            Nothing ->
                                []
                       )
                    ++ (case id of
                            Just idValue ->
                                [ Attribute.id idValue ]

                            Nothing ->
                                []
                       )
                )
                children

        showBlockquote : Maybe String -> List (Html msg) -> Html msg
        showBlockquote class children =
            Html.blockquote [ Attribute.class (Maybe.withDefault "" class) ] children

        showHeading : Int -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showHeading level class id children =
            let
                classAttribute =
                    [ Attribute.class (Maybe.withDefault "" class) ]

                idAttribute =
                    [ Attribute.id (Maybe.withDefault "" id) ]
            in
            case level of
                1 ->
                    Html.h1 (classAttribute ++ idAttribute) children

                2 ->
                    Html.h2 (classAttribute ++ idAttribute) children

                3 ->
                    Html.h3 (classAttribute ++ idAttribute) children

                4 ->
                    Html.h4 (classAttribute ++ idAttribute) children

                5 ->
                    Html.h5 (classAttribute ++ idAttribute) children

                _ ->
                    Html.h6 (classAttribute ++ idAttribute) children

        --showTable:  table th tr td
        showTable : Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showTable class id children =
            let
                classAttribute =
                    [ Attribute.class (Maybe.withDefault "" class) ]

                idAttribute =
                    [ Attribute.id (Maybe.withDefault "" id) ]
            in
            Html.table (classAttribute ++ idAttribute) children

        showTableHeader : Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showTableHeader class id children =
            let
                classAttribute =
                    [ Attribute.class (Maybe.withDefault "" class) ]

                idAttribute =
                    [ Attribute.id (Maybe.withDefault "" id) ]
            in
            Html.th (classAttribute ++ idAttribute) children

        showTableRow : Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showTableRow class id children =
            let
                classAttribute =
                    [ Attribute.class (Maybe.withDefault "" class) ]

                idAttribute =
                    [ Attribute.id (Maybe.withDefault "" id) ]
            in
            Html.tr (classAttribute ++ idAttribute) children

        showTableData : Maybe String -> Maybe String -> List (Html msg) -> Html msg
        showTableData class id children =
            let
                classAttribute =
                    [ Attribute.class (Maybe.withDefault "" class) ]

                idAttribute =
                    [ Attribute.id (Maybe.withDefault "" id) ]
            in
            Html.td (classAttribute ++ idAttribute) children
    in
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
        , Markdown.Html.tag "b" (\children -> Html.b [] children)
        , Markdown.Html.tag "em" (\class children -> Html.em [ Attribute.class (Maybe.withDefault "" class) ] children) |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "p" (\children -> Html.p [] children)
        , Markdown.Html.tag "blockquote" showBlockquote |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "script" (\children -> Html.div [] children)
        , Markdown.Html.tag "a" showLink |> Markdown.Html.withOptionalAttribute "href" |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "iframe"
            showIframe
            |> Markdown.Html.withAttribute "src"
            |> Markdown.Html.withOptionalAttribute "width"
            |> Markdown.Html.withOptionalAttribute "height"
            |> Markdown.Html.withOptionalAttribute "allow"
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
        , Markdown.Html.tag "th"
            showTableHeader
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "tr"
            showTableRow
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "td"
            showTableData
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "i" (Html.i [])
        , Markdown.Html.tag "strong" (Html.strong [])
        , Markdown.Html.tag "br" (Html.br [])
        , Markdown.Html.tag "li" (\id children -> Html.li [ Attribute.id (Maybe.withDefault "" id) ] children) |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "ol" (Html.ol [])
        , Markdown.Html.tag "ul" (Html.ul [])
        , Markdown.Html.tag "code" (Html.code [])
        , Markdown.Html.img "img" (Html.img )
        ]


customHtmlRenderer : Renderer (Html msg)
customHtmlRenderer =
    { defaultHtmlRenderer | html = processHtml }



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
                                BlogPost "" "" ""
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
        body =
            app.data.blogPost.body

        markdownOptions =
            { githubFlavored = Just { tables = False, breaks = False }
            , defaultHighlighting = Nothing
            , sanitize = False
            , smartypants = False
            }
    in
    { title = "Blog Post"
    , -- , body = [ Html.text "You're on the page Blog.Post_"
      --     , EMarkdown.toHtmlWith markdownOptions [] body ] ++ markdownToView body
      body = markdownToView body

    --  , body = [ Html.text "You're on the page Blog.Post_", ExplorationsMarkdown.toHtmlWith { githubFlavored = Just { tables = True, breaks = False }, defaultHighlighting = Just "elm", sanitize = True, smartypants = False } [] body ]
    }
