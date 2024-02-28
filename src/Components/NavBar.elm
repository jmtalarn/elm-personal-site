module Components.NavBar exposing (..)

-- import Effect exposing (Effect)

import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Route exposing (Route)


navBarStyle : List (Html.Attribute msg)
navBarStyle =
    [ Attribute.style "color" "white"
    , Attribute.style "background-color" "dimGray"
    , Attribute.style "padding" ".5rem"
    , Attribute.style "display" "flex"
    , Attribute.style "align-items" "center"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "flex-wrap" "wrap"
    ]

menuStyle : List (Html.Attribute msg)
menuStyle = [ Attribute.style  "position" "absolute"
            , Attribute.style  "background-color" "dimgray"
            , Attribute.style  "margin" "0"
            , Attribute.style  "right" "0"
            , Attribute.style  "padding" "1rem 2rem"
            ]

view : { a | showMenu : Bool } -> msg -> Html msg
view model menuClickedMsg =
    Html.nav navBarStyle
        [ Html.h1 [Attribute.style "margin" "0"] [ Route.Index |> Route.link [] [(Html.text "🏠 jmtalarn.com")]]
        , Html.div 
            [ Attribute.style "margin-left" "auto"] 
            [ Html.button
                [ Html.Events.onClick menuClickedMsg ]
                [ Html.text
                    (if model.showMenu then
                        "Close Menu"

                    else
                        "Open Menu"
                    )
                ]
            , Route.Blog |> Route.link [] [ Html.text "Blog" ]
            , if model.showMenu then
                Html.ul menuStyle
                    [ Html.li [] [ Html.text "Menu item 1" ]
                    , Html.li [] [ Html.text "Menu item 2" ]
                    ]
              else
                Html.text ""
            ]
        ]



-- |> Html.map toMsg
