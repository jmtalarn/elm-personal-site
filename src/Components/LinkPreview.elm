module Components.LinkPreview exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Env
import BackendTask.Http
import BackendTask.Time
import FatalError exposing (FatalError)
import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Parser exposing (Node)
import Svg.Attributes exposing (result)


getLinkData : String -> BackendTask FatalError String
getLinkData url =
    BackendTask.Http.request
        { url = url
        , method = "GET"
        , retries = Just 1
        , timeoutInMs = Just 3000
        , headers = []
        , body = BackendTask.Http.emptyBody
        }
        BackendTask.Http.expectString
        |> BackendTask.onError
            (\_ -> BackendTask.succeed url)
        |> BackendTask.allowFatal


getMetadata : String -> List String
getMetadata content =
    let
        result =
            Html.Parser.run content
    in
    case result of
        Ok _ ->
            [ "Something" ]

        Err _ ->
            [ "Some error parsing " ]


render : String -> List (Html msg) -> Html msg
render url children =
    Html.a [ Attribute.href url ] children
