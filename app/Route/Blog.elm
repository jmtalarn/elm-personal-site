module Route.Blog exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.File
import BackendTask.Glob as Glob
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Json.Decode as Decode exposing (Decoder)
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias BlogPost =
    { body : String
    , slug : String
    , title : String
    }


type alias Data =
    List BlogPost


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    blogPosts


blogPostDecoder : String -> Decoder BlogPost
blogPostDecoder body =
    Decode.map2 (BlogPost body)
        (Decode.field "slug" Decode.string)
        (Decode.field "title" Decode.string)


blogPosts : BackendTask FatalError (List BlogPost)
blogPosts =
    blogPostsGlob
        |> BackendTask.map (List.map (\blogPost -> BackendTask.File.bodyWithFrontmatter blogPostDecoder blogPost.filePath))
        |> BackendTask.resolve
        |> BackendTask.allowFatal


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


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "elm-pages is running"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "elm-pages is running"
    , body =
        [ Html.h1 [] [ Html.text "This is the blog index" ]
        , Html.ul [] (List.map (\{ title, slug } -> Html.li [] [ Route.Blog__Post_ { post = slug } |> Route.link [] [ Html.text title ] ]) app.data)
        ]
    }
