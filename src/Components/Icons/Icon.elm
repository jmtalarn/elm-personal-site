module Components.Icons.Icon exposing (..)

import Dict
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor exposing (IconWeight(..))
import Util.HTMLRender exposing (processStyleAttribute)


light : Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html msg
light icon additionalStyle =
    icon Light |> Phosphor.toHtml (Attribute.style "font-size" "1.4rem" :: Maybe.withDefault [] additionalStyle)


fill : Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html msg
fill icon additionalStyle =
    icon Fill |> Phosphor.toHtml (Attribute.style "font-size" "1.4rem" :: Maybe.withDefault [] additionalStyle)


regular : Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html msg
regular icon additionalStyle =
    icon Regular |> Phosphor.toHtml (Attribute.style "font-size" "1.4rem" :: Maybe.withDefault [] additionalStyle)


duotone : Phosphor.Icon -> Maybe (List (Html.Attribute msg)) -> Html msg
duotone icon additionalStyle =
    icon Duotone |> Phosphor.toHtml (Attribute.style "font-size" "1.4rem" :: Maybe.withDefault [] additionalStyle)


iconWeightMap : String -> IconWeight
iconWeightMap weight =
    case String.toLower <| String.trim weight of
        "thin" ->
            Thin

        "light" ->
            Light

        "regular" ->
            Regular

        "bold" ->
            Bold

        "fill" ->
            Fill

        "duotone" ->
            Duotone

        _ ->
            Regular


markdownIcon : String -> Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
markdownIcon icon text iconWeightAttr style _ =
    let
        dict =
            Dict.fromList
                [ ( "nut", Phosphor.nut )
                , ( "sync", Phosphor.arrowsClockwise )
                , ( "trash", Phosphor.trash )
                , ( "bug", Phosphor.bugBeetle )
                , ( "link", Phosphor.link )
                , ( "code", Phosphor.code )
                , ( "x-logo", Phosphor.xLogo )
                , ( "google-chrome-logo", Phosphor.googleChromeLogo )
                , ( "butterfly", Phosphor.butterfly )
                , ( "github-logo", Phosphor.githubLogo )
                , ( "youtube-logo", Phosphor.youtubeLogo )
                ]

        iconWeight =
            iconWeightMap <| Maybe.withDefault "" iconWeightAttr

        unknown =
            Phosphor.sealQuestion

        styleAttributes =
            processStyleAttribute (Maybe.withDefault "" style)
    in
    Html.span
        [ Attribute.style "display" "flex"
        , Attribute.style "align-items" "center"
        , Attribute.style "gap" "0.4rem"
        ]
        [ (Maybe.withDefault unknown <| Dict.get icon dict) iconWeight |> Phosphor.toHtml (Attribute.style "font-size" "1.4rem" :: styleAttributes)
        , Html.text (Maybe.withDefault "" text)
        ]
