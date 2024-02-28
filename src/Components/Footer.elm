module Components.Footer exposing (..)


import Html exposing (Html)
import Html.Attributes as Attribute
import Html.Events
import Route exposing (Route)
import Time
import Date exposing (Date)

footerStyle : List (Html.Attribute msg)
footerStyle =
    [ Attribute.style "color" "white"
    , Attribute.style "background-color" "dimGray"
    , Attribute.style "padding" ".5rem"
    , Attribute.style "display" "flex"
    , Attribute.style "align-items" "center"
    , Attribute.style "justify-content" "space-between"
    , Attribute.style "font-size" ".8rem"
    ]


footer : Time.Posix -> Html msg
footer now  = 
    let 
        date = Date.fromPosix Time.utc now
    in
    Html.footer footerStyle [Html.text "This is the footer", Html.span [] [Html.text ("©️ "++ String.fromInt (Date.year date) ++" Joan Maria Talarn Espelta" )]]


