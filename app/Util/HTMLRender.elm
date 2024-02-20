module Util.HTMLRender exposing (..)

import Array
import ErrorPage exposing (Msg)
import Html exposing (Html)
import Html.Attributes as Attribute
import SyntaxHighlight


processStyleAttribute : String -> List (Html.Attribute msg)
processStyleAttribute styleString =
    let
        lines =
            String.split ";" styleString |> List.map String.trim |> List.map (\value -> Array.fromList (String.split ":" value |> List.map String.trim))
    in
    List.map (\pair -> Attribute.style (Maybe.withDefault "" (Array.get 0 pair)) (Maybe.withDefault "" (Array.get 1 pair))) lines


showDiv : Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showDiv class style id children =
    Html.div
        ([ Attribute.class (Maybe.withDefault "" class)
         , Attribute.id (Maybe.withDefault "" id)
         ]
            ++ processStyleAttribute (Maybe.withDefault "" style)
        )
        children


showSpan : Maybe String -> Maybe String -> List (Html msg) -> Html msg
showSpan class id children =
    Html.span
        [ Attribute.class (Maybe.withDefault "" class)
        , Attribute.id (Maybe.withDefault "" id)
        ]
        children


showIframe : String -> Maybe String -> Maybe String -> Maybe String -> Maybe String -> Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showIframe src width height allow scrolling frameborder style title _ =
    Html.iframe
        (Attribute.src src
            :: (case allow of
                    Just value ->
                        [ Attribute.attribute "allow" value ]

                    Nothing ->
                        []
               )
            ++ (case scrolling of
                    Just value ->
                        [ Attribute.attribute "allow" value ]

                    Nothing ->
                        []
               )
            ++ (case frameborder of
                    Just value ->
                        [ Attribute.attribute "frameborder" value ]

                    Nothing ->
                        []
               )
            ++ (case width of
                    Just a_width ->
                        [ Attribute.width <| Maybe.withDefault 100 <| String.toInt a_width ]

                    Nothing ->
                        []
               )
            ++ (case height of
                    Just a_height ->
                        [ Attribute.height <| Maybe.withDefault 100 <| String.toInt a_height ]

                    Nothing ->
                        []
               )
            ++ (case title of
                    Just a_title ->
                        [ Attribute.title a_title ]

                    Nothing ->
                        []
               )
            ++ processStyleAttribute (Maybe.withDefault "" style)
        )
        []


showLink : Maybe String -> Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showLink href id target rel children =
    Html.a
        ([]
            ++ (case href of
                    Just hrefValue ->
                        [ Attribute.href hrefValue ]

                    Nothing ->
                        []
               )
            ++ (case id of
                    Just idValue ->
                        [ Attribute.id idValue ]

                    Nothing ->
                        []
               )
            ++ (case target of
                    Just value ->
                        [ Attribute.target value ]

                    Nothing ->
                        []
               )
            ++ (case rel of
                    Just value ->
                        [ Attribute.rel value ]

                    Nothing ->
                        []
               )
        )
        children


showBlockquote : Maybe String -> List (Html msg) -> Html msg
showBlockquote class children =
    Html.blockquote [ Attribute.class (Maybe.withDefault "" class) ] children


showHeading : Int -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showHeading level class id children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]
    in
    case level of
        1 ->
            Html.h1 (classAttribute ++ idAttribute) children

        2 ->
            Html.h2 (classAttribute ++ idAttribute) children

        3 ->
            Html.h3 (classAttribute ++ idAttribute) children

        4 ->
            Html.h4 (classAttribute ++ idAttribute) children

        5 ->
            Html.h5 (classAttribute ++ idAttribute) children

        _ ->
            Html.h6 (classAttribute ++ idAttribute) children



--showTable:  table th tr td


showTable : Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showTable class id style children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]
    in
    Html.table (classAttribute ++ idAttribute ++ processStyleAttribute (Maybe.withDefault "" style)) children


showTableHead : Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showTableHead class id style children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]
    in
    Html.thead (classAttribute ++ idAttribute ++ processStyleAttribute (Maybe.withDefault "" style)) children


showTableBody : Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showTableBody class id style children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]
    in
    Html.tbody (classAttribute ++ idAttribute ++ processStyleAttribute (Maybe.withDefault "" style)) children


showTableHeader : Maybe String -> Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showTableHeader class id style colspan children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]

        colspanAttribute =
            []
                ++ (case colspan of
                        Just value ->
                            [ Attribute.colspan (Maybe.withDefault 0 (String.toInt value)) ]

                        Nothing ->
                            []
                   )
    in
    Html.th (classAttribute ++ idAttribute ++ processStyleAttribute (Maybe.withDefault "" style) ++ colspanAttribute) children


showTableRow : Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showTableRow class id style children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]
    in
    Html.tr (classAttribute ++ idAttribute ++ processStyleAttribute (Maybe.withDefault "" style)) children


showTableData : Maybe String -> Maybe String -> Maybe String -> Maybe String -> List (Html msg) -> Html msg
showTableData class id style colspan children =
    let
        classAttribute =
            [ Attribute.class (Maybe.withDefault "" class) ]

        idAttribute =
            [ Attribute.id (Maybe.withDefault "" id) ]

        colspanAttribute =
            []
                ++ (case colspan of
                        Just value ->
                            [ Attribute.colspan (Maybe.withDefault 0 (String.toInt value)) ]

                        Nothing ->
                            []
                   )
    in
    Html.td (classAttribute ++ idAttribute ++ processStyleAttribute (Maybe.withDefault "" style) ++ colspanAttribute) children


imageStyle : List (Html.Attribute msg)
imageStyle =
    [ Attribute.style "max-width" "100vw"
    , Attribute.style "margin" "0 auto"
    , Attribute.style "display" "block"
    ]


showImage : Maybe String -> Maybe String -> Maybe String -> Maybe String -> String -> List (Html msg) -> Html msg
showImage alt title class id src children =
    Html.img
        ([ Attribute.class (Maybe.withDefault "" class)
         , Attribute.id (Maybe.withDefault "" id)
         , Attribute.title (Maybe.withDefault "" title)
         , Attribute.alt (Maybe.withDefault "" alt)
         , Attribute.src src
         ]
            ++ imageStyle
        )
        children


showDefinitionList : List (Html msg) -> Html msg
showDefinitionList children =
    Html.dl [] children


showDefinitionTerm : Maybe String -> List (Html msg) -> Html msg
showDefinitionTerm id children =
    Html.dt [ Attribute.id (Maybe.withDefault "" id) ] children


showDefinitionDescription : List (Html msg) -> Html msg
showDefinitionDescription children =
    Html.dd [] children


warningBox : List (Html msg) -> Html msg
warningBox children =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "align-items" "center"
        , Attribute.style "gap" "1rem"
        , Attribute.style "padding" "1rem"
        , Attribute.style "background-color" "lightyellow"
        , Attribute.style "font-weight" "100"
        , Attribute.style "border-radius" "10px"
        ]
        [ Html.span
            [ Attribute.style "color" "orange"
            , Attribute.style "text-shadow" "1px 0px gray"
            , Attribute.style "font-size" "2rem"
            ]
            [ Html.text "⚠️" ]
        , Html.div [ Attribute.style "line-height" "1.3rem" ] children
        ]


printStartsOutOf : Int -> Int -> String
printStartsOutOf value outOf =
    List.map
        (\n ->
            if n <= value then
                "★"

            else
                "☆"
        )
        (List.range 1 outOf)
        |> String.join ""


showEasyLikeScore : String -> String -> List (Html msg) -> Html msg
showEasyLikeScore likeness easiness _ =
    let
        easy =
            Maybe.withDefault 0 <| String.toInt easiness

        like =
            Maybe.withDefault 0 <| String.toInt likeness
    in
    Html.div [ Attribute.class "score" ]
        [ Html.label []
            [ Html.text "Easiness"
            , Html.text (printStartsOutOf easy 5)
            ]
        , Html.label []
            [ Html.text "Likeness"
            , Html.text (printStartsOutOf like 5)
            ]
        ]


codeBlock : { body : String, language : Maybe String } -> Html msg
codeBlock { body, language } =
    let
        languagesh =
            case language of
                Just l ->
                    case l of
                        "scss" ->
                            SyntaxHighlight.css

                        "css" ->
                            SyntaxHighlight.css

                        "elm" ->
                            SyntaxHighlight.elm

                        "java" ->
                            SyntaxHighlight.javascript

                        "javascript" ->
                            SyntaxHighlight.javascript

                        "typescript" ->
                            SyntaxHighlight.javascript

                        "python" ->
                            SyntaxHighlight.python

                        "sql" ->
                            SyntaxHighlight.sql

                        "html" ->
                            SyntaxHighlight.xml

                        "xml" ->
                            SyntaxHighlight.xml

                        "json" ->
                            SyntaxHighlight.json

                        "bash" ->
                            SyntaxHighlight.nix

                        "nix" ->
                            SyntaxHighlight.nix

                        "noLang" ->
                            SyntaxHighlight.noLang

                        _ ->
                            SyntaxHighlight.noLang

                Nothing ->
                    SyntaxHighlight.noLang
    in
    Html.div [ Attribute.class "code-block" ]
        [ Html.node "style"
            []
            [ Html.text ".code-block pre code { display: block; text-wrap: wrap; padding: 1rem;}" ]
        , SyntaxHighlight.useTheme
            SyntaxHighlight.oneDark
        , body
            |> languagesh
            |> Result.map (SyntaxHighlight.toBlockHtml (Just 1))
            |> Result.withDefault
                (Html.pre [] [ Html.code [] [ Html.text body ] ])
        ]


codeBlockStyle : List (Html.Attribute msg)
codeBlockStyle =
    [ Attribute.style "width" "100%"
    , Attribute.style "display" "block"
    , Attribute.style "text-wrap" "wrap"
    ]


showCodeBlock : Maybe String -> List (Html msg) -> Html msg
showCodeBlock class children =
    Html.div [ Attribute.class "code-block" ]
        [ Html.pre
            [ Attribute.class (Maybe.withDefault "" class) ]
            [ Html.code [] children ]
        ]
