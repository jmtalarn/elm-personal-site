module Api exposing (routes)

import ApiRoute exposing (ApiRoute)
import BackendTask exposing (BackendTask)
import BackendTask.File
import DataModel.BlogPosts
import FatalError exposing (FatalError)
import Head
import Html exposing (Html)
import Pages
import Pages.Manifest as Manifest
import Route exposing (Route)
import Rss
import Site
import Sitemap
import Time
import Util.Manifest exposing (manifest)
import Util.MarkdownProcessor exposing (getAbstract, markdownToPlainHtml, markdownToText, markdownToView)


routes :
    BackendTask FatalError (List Route)
    -> (Maybe { indent : Int, newLines : Bool } -> Html Never -> String)
    -> List (ApiRoute ApiRoute.Response)
routes getStaticRoutes htmlToString =
    [ rss
        { siteTagline = "Web Dev Notes: Where I jot down tech insights, resources on technology and web development and handy tips to remember." -- SiteOld.tagline
        , siteUrl = Site.config.canonicalUrl --SiteOld.canonicalUrl
        , title = "Web Dev Notes Blog"
        , builtAt = Pages.builtAt
        , indexPage = [ "blog" ]
        }
        postsBackendTask
    , ApiRoute.succeed
        (getStaticRoutes
            |> BackendTask.map
                (\allRoutes ->
                    allRoutes
                        |> List.map
                            (\route ->
                                { path = Route.routeToPath route |> String.join "/"
                                , lastMod = Nothing
                                }
                            )
                        |> Sitemap.build { siteUrl = Site.config.canonicalUrl }
                )
        )
        |> ApiRoute.literal "sitemap.xml"
        |> ApiRoute.single
        |> ApiRoute.withGlobalHeadTags (BackendTask.succeed [ Head.sitemapLink "/sitemap.xml" ])

    --, Pages.Manifest.generator Site.canonicalUrl Manifest.config
    , Manifest.generator Site.config.canonicalUrl manifest
    ]


wrapInCdata : String -> String
wrapInCdata content =
    "<![CDATA[" ++ content ++ "]]>"


postsBackendTask : BackendTask FatalError (List Rss.Item)
postsBackendTask =
    DataModel.BlogPosts.blogPosts
        |> BackendTask.map
            (List.map
                (\{ body, slug, title, category, date } ->
                    { title = title
                    , description = markdownToText (getAbstract body)
                    , url = Maybe.withDefault Route.Index (Route.segmentsToRoute [ "blog", "post", slug ]) |> Route.routeToPath |> String.join "/"
                    , categories = category
                    , author = "Joan Maria Talarn"
                    , pubDate = Rss.Date date
                    , content = Nothing
                    , contentEncoded = Just (markdownToPlainHtml body) --Nothing
                    , enclosure = Nothing
                    }
                )
            )
        |> BackendTask.onError (\error -> BackendTask.fail { fatal = error })
        |> BackendTask.allowFatal


rss :
    { siteTagline : String
    , siteUrl : String
    , title : String
    , builtAt : Time.Posix
    , indexPage : List String
    }
    -> BackendTask FatalError (List Rss.Item)
    -> ApiRoute.ApiRoute ApiRoute.Response
rss options itemsRequest =
    ApiRoute.succeed
        (itemsRequest
            |> BackendTask.map
                (\items ->
                    Rss.generate
                        { title = options.title
                        , description = options.siteTagline
                        , url = options.siteUrl ++ "/" ++ String.join "/" options.indexPage
                        , lastBuildTime = options.builtAt
                        , generator = Just "jmtalarn.com" --"elm-pages"
                        , items = items
                        , siteUrl = options.siteUrl
                        }
                )
        )
        |> ApiRoute.literal "blog/feed.xml"
        |> ApiRoute.single
        |> ApiRoute.withGlobalHeadTags
            (BackendTask.succeed
                [ Head.rssLink "/blog/feed.xml"
                ]
            )
