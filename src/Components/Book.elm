module Components.Book exposing (book3Danimated)

import Components.Icons.Home as HomeIcon
import Html exposing (Html)
import Html.Attributes as Attribute


book3Danimated : Bool -> Html msg
book3Danimated showFeaturedTag =
    Html.div []
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
        , Html.a
            [ Attribute.class "model-book-container"
            , Attribute.href "https://amzn.to/2UdkQyz"
            , Attribute.target "_blank"
            , Attribute.rel "noreferrer noopener"
            ]
            (Html.div
                [ Attribute.class "model-book"
                ]
                [ Html.img
                    [ Attribute.alt "Fundamentos web book cover"
                    , Attribute.src "https://m.media-amazon.com/images/I/71fMoOTr7sL._AC_UL320_.jpg"
                    ]
                    []
                ]
                :: (if showFeaturedTag then
                        [ featuredAvailableOnAmazonKindle ]

                    else
                        []
                   )
            )
        ]


workSansAttributeStyle : List (Html.Attribute msg)
workSansAttributeStyle =
    [ Attribute.style "font-family" "'Work Sans', sans-serif"
    , Attribute.style "font-optical-sizing" "auto"
    , Attribute.style "font-weight" "300"
    , Attribute.style "font-style" "normal"
    , Attribute.style "font-size" "1.3rem"
    , Attribute.style "line-height" "2"
    ]


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
