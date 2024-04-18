module DataModel.BlogPosts exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.File
import BackendTask.Glob as Glob
import Date exposing (Date)
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Iso8601
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Time


type alias BlogPost =
    { body : String
    , slug : String
    , title : String
    , cover : String
    , category : List String
    , tags : List String
    , date : Date
    }


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


blogPostsToDict : BackendTask FatalError (List BlogPost) -> BackendTask FatalError (Dict String BlogPost)
blogPostsToDict blogPostList =
    blogPostList |> BackendTask.map (\list -> Dict.fromList (list |> List.map (\blogPost -> ( .slug blogPost, blogPost ))))


type alias BlogPostList =
    List BlogPost


blogPosts : BackendTask FatalError (List BlogPost)
blogPosts =
    blogPostsGlob
        |> BackendTask.map (List.map (\blogPost -> BackendTask.File.bodyWithFrontmatter blogPostDecoder blogPost.filePath))
        |> BackendTask.resolve
        |> BackendTask.allowFatal


decodeDate : Decoder Date
decodeDate =
    Iso8601.decoder
        |> Decode.map
            (\posix ->
                Date.fromPosix Time.utc posix
            )



-- decodeDate_ =
--     Decode.string
--         |> Decode.andThen
--             (\str ->
--                 Date.fromIsoString str
--                     |> Decode.fromResult
--             )


blogPostDecoder : String -> Decoder BlogPost
blogPostDecoder body =
    Decode.map6 (BlogPost body)
        (Decode.field "slug" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "cover" Decode.string)
        (Decode.field "category" <| Decode.list <| Decode.string)
        (Decode.field "tags" <| Decode.list <| Decode.string)
        (Decode.field "date" decodeDate)
