module Util.Manifest exposing (manifest)

import BackendTask exposing (BackendTask)
import Color exposing (Color)
import MimeType
import Pages.Manifest as Manifest
import Pages.Url
import Route
import UrlPath


manifest : BackendTask error Manifest.Config
manifest =
    Manifest.init
        { name = "Joan Maria Talarn ~ Website, blog and CV"
        , description = "This is my website jmtalarn, where I put together my blog, my CV and other personal information. Build with Elm."
        , startUrl = Route.Index |> Route.toPath
        , icons =
            [ icon "android-chrome-192x192.png" MimeType.Png 192
            , icon "android-chrome-512x512.png" MimeType.Png 512
            ]
        }
        |> Manifest.withBackgroundColor Color.white
        |> Manifest.withThemeColor Color.white
        |> BackendTask.succeed


icon :
    String
    -> MimeType.MimeImage
    -> Int
    -> Manifest.Icon
icon file format width =
    { src = iconUrl file
    , sizes = [ ( width, width ) ]
    , mimeType = format |> Just
    , purposes = [ Manifest.IconPurposeAny, Manifest.IconPurposeMaskable ]
    }


iconUrl : String -> Pages.Url.Url
iconUrl file =
    [ "images", "favicon", file ] |> UrlPath.join |> Pages.Url.fromPath
