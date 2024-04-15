module Components.Ribbon exposing (ribbon, ribbonReverse)

import Html exposing (Html)
import Html.Attributes as Attribute


ribbonReverse : String -> Html msg
ribbonReverse text =
    renderRibbon text True


ribbon : String -> Html msg
ribbon text =
    renderRibbon text False


renderRibbon : String -> Bool -> Html msg
renderRibbon text reverse =
    Html.div
        ([ Attribute.class "ribbon"
         , Attribute.style "width" "150px"
         , Attribute.style "height" "150px"
         , Attribute.style "overflow" "hidden"
         , Attribute.style "position" "absolute"
         , Attribute.style "top" "-10px"
         , Attribute.style "z-index" "1"
         ]
            ++ (if reverse then
                    [ Attribute.style "right" "-0.6rem"
                    , Attribute.style "transform" "rotate(90deg)"
                    ]

                else
                    [ Attribute.style "left" "-0.6rem" ]
               )
        )
        [ Html.node "style"
            []
            [ Html.text """
                .ribbon::before,
                .ribbon::after {
                    position: absolute;
                    z-index: -1;
                    content: '';
                    display: block;
                    /* border: 5px solid #2980b9;*/
                    border: 5px solid CornflowerBlue;
                    border-top-color: transparent;
                    border-left-color: transparent;
                    filter: brightness(80%)
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

            --, Attribute.style "background-color" "#3498db"
            , Attribute.style "background-color" "CornflowerBlue"
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
