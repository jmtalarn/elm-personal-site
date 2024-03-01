module Route.Blog exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Components.BlogPostCard exposing (blogPostCard)
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
    {}


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


data : BackendTask FatalError (List BlogPost)
data =
    blogPosts


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "jmtalarn.com ~ web dev notes blog "
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "jmtalarn.com ~ web dev notes blog"
        }
        |> Seo.website


blogPostGridStyle : List (Html.Attribute msg)
blogPostGridStyle =
    [ Attribute.style "column-count" "auto"
    , Attribute.style "column-gap" "5px"
    , Attribute.style "column-width" "25rem"
    ]



-- [ Attribute.style "display" "grid"
-- , Attribute.style "grid-template-rows" "auto"
-- , Attribute.style "grid-template-columns" "repeat(auto-fit, minmax(20rem, 1fr))"
-- , Attribute.style "grid-gap" "1rem"
-- , Attribute.style "grid-auto-flow" "dense"
-- ]


view :
    App (List BlogPost) ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    let
        blogPosts =
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
                app.data
    in
    { title = "elm-pages is running"
    , body =
        [ Html.h1 [] [ Html.text "This is the blog index" ]
        , Html.div blogPostGridStyle (List.map blogPostCard blogPosts)
        ]
    }
