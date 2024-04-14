module Components.Home exposing (..)

import Html exposing (Html)
import Html.Attributes as Attribute
import Route
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr


caretoStyle : List (Html.Attribute msg)
caretoStyle =
    [ Attribute.style "border-radius" "50%"
    , Attribute.style "z-index" "1"
    , Attribute.style "position" "relative"
    , Attribute.style "width" "22rem"
    ]


portrait : List (Html msg)
portrait =
    [ Html.div
        [ Attribute.style "position" "relative"
        , Attribute.style "width" "22rem"
        , Attribute.style "border-radius" "50%"
        , Attribute.style "flex" "0 0 22rem"
        ]
        [ Html.img (Attribute.src "/images/home/careto_trucat-removebg-preview.png" :: caretoStyle) []
        , animatedSvgBackground
            [ Attribute.style "position" "absolute"
            , Attribute.style "height" "22rem"
            , Attribute.style "width" "35rem"
            , Attribute.style "left" "-8rem"
            , Attribute.style "top" "0rem"
            , Attribute.style "filter" "blur(40px)"
            ]
        ]
    ]


message : Html msg
message =
    Html.div
        [ Attribute.class "hero-message", Attribute.style "flex" "1 1 18rem" ]
        [ Html.h1
            [ Attribute.class "hero-title "
            , attributeLinearGradient
            , Attribute.style "background-clip" "text"
            , Attribute.style "color" "transparent"
            , Attribute.style "filter" "url(#hue-rotate)"
            ]
            [ Html.text "I'm a web developer" ]
        , Html.p [ Attribute.class "hero-text" ]
            [ Html.text "Javascript, Html and CSS. Decorating it often with React and Typescript. Quite a bit of Java and NodeJs. Amusing myself with Elm." ]
        ]


hero : Html msg
hero =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "row"
        , Attribute.style "align-items" "center"
        , Attribute.style "justify-content" "space-evenly"
        , Attribute.style "position" "relative"
        , Attribute.style "flex-wrap" "wrap-reverse"
        , Attribute.style "max-width" "800px"
        , Attribute.style "margin" "0 auto"
        ]
        (portrait ++ [ message ])


blog : Html msg
blog =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "row"
        , Attribute.style "align-items" "flex-start"
        , Attribute.style "justify-content" "space-evenly"
        , Attribute.style "position" "relative"
        , Attribute.style "gap" "2rem"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "margin" "4rem auto"
        , Attribute.style "max-width" "960px"
        ]
        [ Html.div [ Attribute.style "flex" "1 1 40%" ]
            [ Html.h2
                []
                [ Html.text "Check my blog"
                ]
            , Html.p [ Attribute.style "text-align" "justify" ] [ Html.text "Quis aute enim dolor excepteur ullamco Lorem ex occaecat commodo ut culpa culpa occaecat aliqua. Laboris laborum ex labore sunt exercitation sunt qui enim incididunt ad. Nostrud id veniam in quis consectetur velit labore dolor dolore voluptate exercitation dolor. Duis excepteur id cillum consequat do minim ut ullamco." ]
            , Route.Blog__Page__ { page = Nothing }
                |> Route.link [] [ Html.text "Web dev notes" ]
            ]
        , Html.div [ Attribute.style "position" "relative" ]
            [ Html.img
                [ Attribute.src "/images/home/openart-image_Ko4Z9KtJ_1712956581329_raw.jpg"
                , Attribute.style "width" "20rem"
                , Attribute.style "flex" "0 0 20rem"
                , Attribute.style "border-radius" "10px"
                ]
                []
            , colorfulBlurredBackground
            ]
        ]


attributeLinearGradient : Html.Attribute msg
attributeLinearGradient =
    Attribute.style "background" "linear-gradient(90deg, rgb(255, 95, 109) 0%, rgb(255, 195, 113) 100%)"


book : Html msg
book =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "row"
        , Attribute.style "align-items" "flex-start"
        , Attribute.style "justify-content" "space-evenly"
        , Attribute.style "position" "relative"
        , Attribute.style "gap" "2rem"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "max-width" "640px"
        ]
        [ Html.node "style"
            []
            [ Html.text """
            .model-book-container {
                display: flex;
                align-items: center;
                justify-content: center;
                perspective: 600px
            }

            @keyframes initAnimation {
                0% {
                    transform: rotateY(0)
                }

                100% {
                    transform: rotateY(-30deg)
                }
            }

            .model-book {
                width: 200px;
                height: 300px;
                position: relative;
                transform-style: preserve-3d;
                transform: rotateY(-30deg);
                transition: 1s ease;
                animation: 1s ease 0s 1 initAnimation
            }

            .model-book-container {
                margin: 4rem auto
            }

            .model-book-container:focus .model-book,.model-book-container:hover .model-book {
                transform: rotateY(0)
            }

            .model-book>:first-child {
                position: absolute;
                top: 0;
                left: 0;
                background-color: red;
                width: 200px;
                height: 300px;
                transform: translateZ(12.5px);
                background-color: #01060f;
                border-radius: 0 2px 2px 0;
                box-shadow: 5px 5px 20px #666
            }

            .model-book::before {
                position: absolute;
                content: ' ';
                background-color: #00f;
                left: 0;
                top: 3px;
                width: 23px;
                height: 294px;
                transform: translateX(184.5px) rotateY(90deg);
                background: linear-gradient(90deg,#fff 0,#f9f9f9 5%,#fff 10%,#f9f9f9 15%,#fff 20%,#f9f9f9 25%,#fff 30%,#f9f9f9 35%,#fff 40%,#f9f9f9 45%,#fff 50%,#f9f9f9 55%,#fff 60%,#f9f9f9 65%,#fff 70%,#f9f9f9 75%,#fff 80%,#f9f9f9 85%,#fff 90%,#f9f9f9 95%,#fff 100%)
            }

            .model-book::after {
                position: absolute;
                top: 0;
                left: 0;
                content: ' ';
                width: 200px;
                height: 300px;
                transform: translateZ(-12.5px);
                background-color: #01060f;
                border-radius: 0 2px 2px 0;
                box-shadow: -10px 0 50px 10px #666
            }
        """ ]
        , Html.div [ Attribute.style "flex" "1 1 40%" ]
            [ Html.h2
                []
                [ Html.text "Check my book"
                ]
            , Html.p [ Attribute.style "text-align" "justify" ] [ Html.text "Book published on Amazon about Web foundations. " ]
            , Html.a
                [ Attribute.href "https://amzn.to/2UdkQyz"
                , Attribute.target "_blank"
                , Attribute.rel "noreferrer noopener"
                ]
                [ Html.text "Check it out on Amazon" ]
            ]
        , Html.a
            [ Attribute.class "model-book-container"
            , Attribute.href "https://amzn.to/2UdkQyz"
            , Attribute.target "_blank"
            , Attribute.rel "noreferrer noopener"
            ]
            [ Html.div
                [ Attribute.class "model-book"
                ]
                [ Html.img
                    [ Attribute.alt "Fundamentos web cover"
                    , Attribute.src "https://m.media-amazon.com/images/I/71fMoOTr7sL._AC_UL320_.jpg"
                    ]
                    []
                ]
            ]
        ]


cv : Html msg
cv =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "row-reverse"
        , Attribute.style "align-items" "flex-start"
        , Attribute.style "justify-content" "space-evenly"
        , Attribute.style "position" "relative"
        , Attribute.style "gap" "2rem"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "margin" "4rem auto"
        , Attribute.style "max-width" "960px"
        ]
        [ Html.div [ Attribute.style "flex" "1 1 40%" ]
            [ Html.h2
                []
                [ Html.text "Check my CV"
                ]
            , Html.p [ Attribute.style "text-align" "justify" ] [ Html.text "Quis aute enim dolor excepteur ullamco Lorem ex occaecat commodo ut culpa culpa occaecat aliqua. Laboris laborum ex labore sunt exercitation sunt qui enim incididunt ad. Nostrud id veniam in quis consectetur velit labore dolor dolore voluptate exercitation dolor. Duis excepteur id cillum consequat do minim ut ullamco." ]
            , Route.Cv
                |> Route.link [] [ Html.text "CV" ]
            ]
        , Html.div [ Attribute.style "position" "relative" ]
            [ Html.img
                [ Attribute.src "/images/home/openart-image_LlRWZaUM_1712956596110_raw.jpg"
                , Attribute.style "width" "20rem"
                , Attribute.style "flex" "0 0 20rem"
                , Attribute.style "border-radius" "10px"
                ]
                []
            , colorfulBlurredBackground
            ]
        ]


colorfulBlurredBackground : Html msg
colorfulBlurredBackground =
    Html.div
        [ Attribute.style "width" "100%"
        , Attribute.style "height" "100%"
        , Attribute.style "position" "absolute"
        , Attribute.style "top" "1rem"
        , Attribute.style "left" "1rem"
        , Attribute.style "z-index" "-1"
        , attributeLinearGradient
        , Attribute.style "filter" "url(#hue-rotate) blur(5px)"
        , Attribute.style "border-radius" "10px"
        ]
        []


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


ribbon : String -> Html msg
ribbon text =
    Html.div
        [ Attribute.class "ribbon"
        , Attribute.style "width" "150px"
        , Attribute.style "height" "150px"
        , Attribute.style "overflow" "hidden"
        , Attribute.style "position" "absolute"
        , Attribute.style "top" "3.8rem"
        , Attribute.style "left" "1.3rem"
        ]
        [ Html.node "style"
            []
            [ Html.text """
                .ribbon::before,
                .ribbon::after {
                    position: absolute;
                    z-index: -1;
                    content: '';
                    display: block;
                    border: 5px solid #2980b9;
                    border-top-color: transparent;
                    border-left-color: transparent;
                }
                .ribbon::before {
                    top: 0;
                    right: 0;
                }
                .ribbon::after {
                    bottom: 0;
                    left: 0;
                }
                """
            ]
        , Html.span
            [ Attribute.style "position" "absolute"
            , Attribute.style "display" "block"
            , Attribute.style "width" "225px"
            , Attribute.style "padding" "15px 0"
            , Attribute.style "background-color" "#3498db"
            , Attribute.style "box-shadow" "0 5px 10px rgba(0,0,0,.1)"
            , Attribute.style "color" "#fff"
            , Attribute.style "font" "700 18px/1 'Lato', sans-serif"
            , Attribute.style "text-shadow" "0 1px 1px rgba(0,0,0,.2)"
            , Attribute.style "text-transform" "uppercase"
            , Attribute.style "text-align" "center"
            , Attribute.style "right" "-25px"
            , Attribute.style "top" "30px"
            , Attribute.style "transform" "rotate(-45deg)"
            ]
            [ Html.text text ]
        ]
