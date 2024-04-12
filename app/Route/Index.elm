module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attribute
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { message : String
    }


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
    BackendTask.succeed Data
        |> BackendTask.andMap
            (BackendTask.succeed "Hello!")


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "jmtalarn.com"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "jmtalarn.com ~ Home "
        }
        |> Seo.website


caretoStyle : List (Html.Attribute msg)
caretoStyle =
    [ Attribute.style "border-radius" "50%"

    -- , Attribute.style "border" "2px dotted salmon"
    -- , Attribute.style "box-shadow" "5px 5px 10px Dimgray"
    , Attribute.style "position" "absolute"

    --, Attribute.style "width" "500px"
    --, Attribute.style "height" "200px"
    ]


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "Joan Maria Talarn ~ web developer"
    , body =
        [ Html.h1 [] [ Html.text "This is me! " ]
        , Html.p []
            [ Html.text <| "The message is: " ++ app.data.message
            ]
        , Html.div
            [ Attribute.style "position" "relative"
            , Attribute.style "width" "500px"
            , Attribute.style "border-radius" "50%"
            ]
            [ animatedSvgBackground
                [ Attribute.style "position" "absolute"
                , Attribute.style "height" "600px"
                , Attribute.style "width" "800px"
                , Attribute.style "left" "-10rem"
                , Attribute.style "top" "-3rem"
                , Attribute.style "filter" "blur(40px)"
                ]
            , Html.img (Attribute.src "/images/home/careto_trucat-removebg-preview.png" :: caretoStyle) []
            ]
        , Html.ul []
            [ Html.li []
                [ Route.Blog__Page__ { page = Nothing }
                    |> Route.link [] [ Html.text "Web dev notes" ]
                ]
            , Html.li []
                [ Route.Cv
                    |> Route.link [] [ Html.text "CV" ]
                ]
            ]
        ]
    }


animatedSvgBackground : List (Html.Attribute msg) -> Html.Html msg
animatedSvgBackground style =
    svg
        ([ SvgAttr.viewBox "0 0 800 500"
         , SvgAttr.preserveAspectRatio "none"
         , SvgAttr.width "100%"
         , SvgAttr.id "blobSvg"
         ]
            ++ style
        )
        [ Svg.g
            [ SvgAttr.transform "translate(174.31295776367188, 21.84337615966797)"
            ]
            [ Svg.defs []
                [ Svg.filter
                    [ SvgAttr.id "hue-rotate"
                    ]
                    [ Svg.feColorMatrix
                        [ SvgAttr.type_ "hueRotate"
                        , SvgAttr.values "0"
                        ]
                        [ Svg.animate
                            [ SvgAttr.attributeName "values"
                            , SvgAttr.dur "20s"
                            , SvgAttr.from "0"
                            , SvgAttr.to "360"
                            , SvgAttr.repeatCount "indefinite"
                            ]
                            []
                        ]
                    ]
                , Svg.linearGradient
                    [ SvgAttr.id "gradient"
                    , SvgAttr.x1 "0%"
                    , SvgAttr.y1 "0%"
                    , SvgAttr.x2 "0%"
                    , SvgAttr.y2 "100%"
                    ]
                    [ Svg.stop
                        [ SvgAttr.offset "0%"
                        , SvgAttr.stopColor "rgb(255, 95, 109)"
                        ]
                        []
                    , Svg.stop
                        [ SvgAttr.offset "100%"
                        , SvgAttr.stopColor "rgb(255, 195, 113)"
                        ]
                        []
                    ]
                ]
            , path
                [ SvgAttr.class "blob"
                , SvgAttr.fill "url(#gradient)"
                , SvgAttr.filter "url(#hue-rotate)"
                ]
                [ Svg.animate
                    [ SvgAttr.attributeName "d"
                    , SvgAttr.dur "10s"
                    , SvgAttr.repeatCount "indefinite"
                    , SvgAttr.values """M390.5,305Q314,360,245.5,368Q177,376,95,313Q13,250,80.5,162Q148,74,259,58Q370,42,418.5,146Q467,250,390.5,305Z;
                                        M398,340.5Q354,431,240.5,446.5Q127,462,100,356Q73,250,122.5,182Q172,114,272.5,75.5Q373,37,407.5,143.5Q442,250,398,340.5Z;
                                        M394.5,320Q331,390,249.5,390.5Q168,391,92.5,320.5Q17,250,78.5,154.5Q140,59,232,90Q324,121,391,185.5Q458,250,394.5,320Z;
                                        M354,308Q317,366,234,394Q151,422,106,336Q61,250,110.5,172Q160,94,259.5,78Q359,62,375,156Q391,250,354,308Z;
                                        M390.5,305Q314,360,245.5,368Q177,376,95,313Q13,250,80.5,162Q148,74,259,58Q370,42,418.5,146Q467,250,390.5,305Z;"""
                    ]
                    []
                ]
            ]
        ]
