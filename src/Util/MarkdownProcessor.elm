module Util.MarkdownProcessor exposing (markdownToText, markdownToView)

import Components.Icon as Icon
import Components.TwitterTweet exposing (twitterTweet)
import Components.WarningBox exposing (warningBox)
import Html exposing (Html)
import Html.Attributes as Attribute
import Markdown.Block
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer exposing (Renderer, defaultHtmlRenderer)
import Util.HTMLRender exposing (..)


processHtml : Markdown.Html.Renderer (List (Html msg) -> Html msg)
processHtml =
    Markdown.Html.oneOf
        [ Markdown.Html.tag "div"
            showDiv
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "span"
            showSpan
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "b" (Html.b [])
        , Markdown.Html.tag "em" (\class children -> Html.em [ Attribute.class (Maybe.withDefault "" class) ] children) |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "p" (Html.p [])
        , Markdown.Html.tag "blockquote" showBlockquote |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "script" (\children -> Html.div [] children)
        , Markdown.Html.tag "a" showLink |> Markdown.Html.withOptionalAttribute "href" |> Markdown.Html.withOptionalAttribute "id" |> Markdown.Html.withOptionalAttribute "target" |> Markdown.Html.withOptionalAttribute "rel"
        , Markdown.Html.tag "iframe"
            showIframe
            |> Markdown.Html.withAttribute "src"
            |> Markdown.Html.withOptionalAttribute "width"
            |> Markdown.Html.withOptionalAttribute "height"
            |> Markdown.Html.withOptionalAttribute "allow"
            |> Markdown.Html.withOptionalAttribute "scrolling"
            |> Markdown.Html.withOptionalAttribute "frameborder"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "title"
        , Markdown.Html.tag "h1"
            (showHeading 1)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h2"
            (showHeading 2)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h3"
            (showHeading 3)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h4"
            (showHeading 4)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h5"
            (showHeading 5)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h6"
            (showHeading 6)
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "table"
            showTable
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "thead"
            showTableHead
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "tbody"
            showTableBody
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "th"
            showTableHeader
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "colspan"
        , Markdown.Html.tag "tr"
            showTableRow
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "td"
            showTableData
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "colspan"
        , Markdown.Html.tag "i" (Html.i [])
        , Markdown.Html.tag "strong" (\children -> Html.span [] [ Html.strong [] children ])
        , Markdown.Html.tag "br" (Html.br [])
        , Markdown.Html.tag "li" (\id children -> Html.li [ Attribute.id (Maybe.withDefault "" id) ] children) |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "ol" (Html.ol [])
        , Markdown.Html.tag "ul" (Html.ul [])
        , Markdown.Html.tag "code" showCodeBlock |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "img" showImage
            |> Markdown.Html.withOptionalAttribute "alt"
            |> Markdown.Html.withOptionalAttribute "title"
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withAttribute "src"
        , Markdown.Html.tag "dl" showDefinitionList
        , Markdown.Html.tag "dd" showDefinitionDescription
        , Markdown.Html.tag "dt" showDefinitionTerm |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "figure" (Html.figure [])
        , Markdown.Html.tag "figcaption" (Html.figcaption [])
        , Markdown.Html.tag "hr" (Html.hr [])
        , Markdown.Html.tag "label" (Html.label [])
        , Markdown.Html.tag "easy-like-score" showEasyLikeScore
            |> Markdown.Html.withAttribute "likeness"
            |> Markdown.Html.withAttribute "easiness"
        , Markdown.Html.tag "warning" warningBox
        , Markdown.Html.tag "twitter-tweet" twitterTweet
        , Markdown.Html.tag "icon" Icon.markdownIcon
            |> Markdown.Html.withAttribute "icon"
            |> Markdown.Html.withOptionalAttribute "text"
            |> Markdown.Html.withOptionalAttribute "style"
        ]


customHtmlRenderer : Renderer (Html msg)
customHtmlRenderer =
    { defaultHtmlRenderer
        | image = \{ alt, src, title } -> showImage (Just alt) title Nothing Nothing Nothing src []
        , blockQuote = \content -> showBlockquote Nothing content
        , codeBlock = codeBlock
        , html = processHtml
    }


markdownToView : String -> List (Html msg)
markdownToView markdownString =
    markdownString
        |> Markdown.Parser.parse
        |> Result.mapError (\error -> error |> List.map Markdown.Parser.deadEndToString |> String.join "\n")
        |> Result.andThen
            (\blocks ->
                Markdown.Renderer.render
                    customHtmlRenderer
                    blocks
            )
        |> (\result ->
                case result of
                    Ok markdown ->
                        markdown

                    Err error ->
                        [ Html.text "There was an error parsing the Markdown", Html.text error ]
           )


markdownToText : String -> String
markdownToText markdownString =
    markdownString
        |> Markdown.Parser.parse
        |> Result.withDefault []
        |> Markdown.Renderer.render textRenderer
        |> Result.withDefault []
        |> String.join " "
        |> String.replace "  " " "


textRenderer : Renderer String
textRenderer =
    { heading = \{ children } -> String.concat children
    , paragraph = String.concat
    , hardLineBreak = "\n"
    , blockQuote = String.concat
    , strong = String.concat
    , emphasis = String.concat
    , codeSpan = identity
    , link = \link content -> String.concat content
    , image = \imageInfo -> ""
    , text = identity
    , unorderedList =
        \items ->
            items
                |> List.map
                    (\(Markdown.Block.ListItem _ children) ->
                        String.concat children
                    )
                |> String.join " "
    , orderedList =
        \startingIndex items ->
            items
                |> List.indexedMap
                    (\idx itemBlocks ->
                        String.fromInt (idx + startingIndex) ++ ") " ++ String.concat itemBlocks
                    )
                |> String.join " "
    , html = Markdown.Html.oneOf [] |> Markdown.Html.map (always String.concat)
    , codeBlock = \block -> block.body
    , thematicBreak = " "
    , table = always ""
    , tableHeader = always ""
    , tableBody = always ""
    , tableRow = always ""
    , tableHeaderCell = \_ _ -> ""
    , tableCell = \_ _ -> ""
    , strikethrough = String.concat
    }
