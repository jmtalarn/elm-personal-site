module Components.Home exposing (..)

import Components.CompanySkillHighlight exposing (companySkillHighlight)
import Components.Icons.Home as HomeIcon
import Components.Icons.Icon as Icon
import DataModel.CV exposing (Job)
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor
import Route
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr


caretoStyle : List (Html.Attribute msg)
caretoStyle =
    [ Attribute.style "border-radius" "50%"
    , Attribute.style "z-index" "1"
    , Attribute.style "position" "relative"
    , Attribute.style "max-width" "22rem"
    , Attribute.style "width" "100%"
    ]


portrait : List (Html msg)
portrait =
    [ Html.div
        [ Attribute.style "position" "relative"
        , Attribute.style "max-width" "22rem"
        , Attribute.style "width" "100%"
        , Attribute.style "border-radius" "50%"

        --, Attribute.style "flex" "0 0 22rem"
        ]
        [ Html.img (Attribute.src "/images/home/careto_trucat-removebg-preview.png" :: caretoStyle) []
        , animatedSvgBackground
            [ Attribute.style "position" "absolute"
            , Attribute.style "height" "22rem"
            , Attribute.style "max-width" "35rem"
            , Attribute.style "width" "100%"
            , Attribute.style "left" "0rem"
            , Attribute.style "top" "0rem"
            , Attribute.style "filter" "blur(40px)"
            ]
        ]
    ]


antonFontAttributeStyle : List (Html.Attribute msg)
antonFontAttributeStyle =
    [ Attribute.style "font-family" "\"Anton\", sans-serif"
    , Attribute.style "font-weight" "400"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "3rem"
    , Attribute.style "line-height" "3rem"
    ]


workSansAttributeStyle : List (Html.Attribute msg)
workSansAttributeStyle =
    [ Attribute.style "font-family" "\"Work Sans\", sans-serif"
    , Attribute.style "font-optical-sizing" "auto"
    , Attribute.style "font-weight" "300"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "1.3rem"
    , Attribute.style "line-height" "2"
    ]


message : Html msg
message =
    Html.div
        [ Attribute.class "hero-message", Attribute.style "flex" "1 1 18rem" ]
        [ Html.h1
            ([ Attribute.class "hero-title "
             , attributeLinearGradient
             , Attribute.style "background-clip" "text"
             , Attribute.style "color" "transparent"
             , Attribute.style "filter" "url(#hue-rotate)"
             , Attribute.style "text-align" "right"
             ]
                ++ antonFontAttributeStyle
            )
            [ Html.text "I'm a web developer" ]
        , Html.p (Attribute.class "hero-text" :: workSansAttributeStyle)
            [ Html.text "HTML"
            , HomeIcon.html5 [ Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text ", Javascript"
            , HomeIcon.javascript [ Attribute.style "margin-left" "5px", Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text ", and CSS"
            , HomeIcon.css3 [ Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text ". Decorating it often with React"
            , HomeIcon.react [ Attribute.style "margin-left" "4px", Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text " and Typescript"
            , HomeIcon.typescript [ Attribute.style "margin-left" "5px", Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text ". Quite a bit of Java"
            , HomeIcon.java [ Attribute.style "margin-left" "2px", Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text " and NodeJs"
            , HomeIcon.nodejs [ Attribute.style "margin-left" "3px", Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text ". Amusing myself with Elm"
            , HomeIcon.elm [ Attribute.style "margin-left" "5px", Attribute.style "vertical-align" "text-bottom", Attribute.style "width" "2rem", Attribute.style "height" "2rem" ]
            , Html.text "."
            ]
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
                [ Html.text "Web dev notes"
                ]
            , Html.p [ Attribute.style "text-align" "justify" ] [ Html.text "Web dev notes is my blog, a space where I share insights, experiences, and reflections on various topics related to technology, web development, and beyond. Through my blog, I aim to provide valuable resources, tutorials, and discussions to fellow developers, tech enthusiasts, and anyone passionate about the digital world.\nExplore a wealth of articles covering frontend development techniques, frameworks, JavaScript libraries, software engineering insights, and much more. Whether you're a seasoned developer seeking advanced tips or a newcomer eager to learn, there's something here for everyone.\nJoin me on this journey of exploration, discovery, and continuous learning. Let's dive into the exciting world of technology together!\n" ]
            , Route.Blog__Page__ { page = Nothing }
                |> Route.link [] [ Html.text "Click here to visit my blog Web dev notes" ]
            ]
        , Html.div [ Attribute.style "position" "relative", Attribute.style "padding" "1rem" ]
            [ Html.img
                [ Attribute.src "/images/home/openart-image_Ko4Z9KtJ_1712956581329_raw.jpg"
                , Attribute.style "max-width" "20rem"
                , Attribute.style "width" "100%"
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
        , Attribute.style "margin" "0 auto"
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
                [ Html.text "Uncover my book"
                ]
            , Html.p [ Attribute.style "text-align" "justify" ] [ Html.text "Review 'Fundamentos Web' on Amazon – your go-to guide for mastering the essentials of web development. This book provides clear definitions and explanations of key concepts in web foundations, making it an indispensable resource for both beginners and experienced developers alike. Get ready to enhance your understanding of CSS, HTML, and JavaScript as you embark on the journey into the exciting world of web development" ]
            , Html.a
                [ Attribute.href "https://amzn.to/2UdkQyz"
                , Attribute.target "_blank"
                , Attribute.rel "noreferrer noopener"
                , Attribute.style "display" "flex"
                , Attribute.style "align-items" "center"
                ]
                [ Html.text "Check it out on Amazon"
                , Icon.regular Phosphor.amazonLogo Nothing
                ]
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
            , featuredAvailableOnAmazonKindle
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
                [ Html.text "Explore My Work"
                ]
            , Html.p [ Attribute.style "text-align" "justify" ] [ Html.text "Please take a moment to explore my CV to learn more about my background, working experience, education, certifications, and aside projects. I'm excited to share my journey with you and showcase how my skills and expertise can add value to your team or project.\n            Thank you for considering my profile, and I look forward to the opportunity to connect and discuss how we can collaborate to achieve our goals." ]
            , Route.Cv
                |> Route.link [] [ Html.text "Take a look at my CV." ]
            ]
        , Html.div [ Attribute.style "position" "relative", Attribute.style "padding" "1rem" ]
            [ Html.img
                [ Attribute.src "/images/home/openart-image_LlRWZaUM_1712956596110_raw.jpg"
                , Attribute.style "max-width" "20rem"
                , Attribute.style "width" "100%"
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
        [ Attribute.style "width" "calc(100% - 2rem)"
        , Attribute.style "height" "calc(100% - 2rem)"
        , Attribute.style "position" "absolute"
        , Attribute.style "top" "2rem"
        , Attribute.style "left" "2rem"
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


featuredSkillsAndCompaniesLabel : Html msg
featuredSkillsAndCompaniesLabel =
    Html.div
        ([ Attribute.style "background-color" "#ffc600"
         , Attribute.style "font-weight" "900"
         , Attribute.style "transform-origin" "left center"
         , Attribute.style "transform" "scale(0.6)"
         , Attribute.style "padding" "0 2rem"
         , Attribute.style "top" "1rem"
         , Attribute.style "left" "0.2rem"
         , Attribute.style "position" "absolute"
         , Attribute.style "z-index" "2"
         , Attribute.style "box-shadow" "4px 4px 8px rgba(0, 0, 0, 0.8)"
         ]
            ++ workSansAttributeStyle
        )
        [ Html.text "Featured skills and companies" ]


featuredAvailableOnAmazonKindle : Html msg
featuredAvailableOnAmazonKindle =
    Html.div
        ([ Attribute.style "background-color" "#ffc600"
         , Attribute.style "font-weight" "900"
         , Attribute.style "transform" "scale(0.6)"
         , Attribute.style "transform-origin" "right center"
         , Attribute.style "padding" "0.2rem 0rem 0.2rem 2rem"
         , Attribute.style "bottom" "1rem"
         , Attribute.style "right" "0rem"
         , Attribute.style "position" "absolute"
         , Attribute.style "z-index" "2"
         , Attribute.style "width" "100%"
         , Attribute.style "box-shadow" "4px 4px 8px rgba(0, 0, 0, 0.8)"
         ]
            ++ workSansAttributeStyle
            ++ [ Attribute.style "display" "flex"
               , Attribute.style "align-items" "center"
               , Attribute.style "width" "20rem"
               , Attribute.style "paddo" "20rem"
               ]
        )
        [ Html.text "Available on"
        , HomeIcon.amazonKindle
            [ Attribute.title "Amazon Kindle"
            , Attribute.style "height" "2rem"
            , Attribute.style "flex" "1"
            ]
        ]
