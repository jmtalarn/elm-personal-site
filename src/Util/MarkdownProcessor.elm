module Util.MarkdownProcessor exposing (gatherLinks, getAbstract, markdownToPlainHtml, markdownToText, markdownToView)

import Components.Icons.Icon as Icon
import Components.Icons.TechIcon as TechIcon
import Components.LinkCard as LinkCard
import Components.TwitterTweet exposing (twitterTweet)
import Components.WarningBox exposing (warningBox)
import Dict
import Html exposing (Html)
import Html.Attributes as Attribute
import Markdown.Block exposing (Block)
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer exposing (Renderer, defaultHtmlRenderer)
import Util.HTMLRender exposing (..)


processHtml : LinkCard.CardLinks -> Markdown.Html.Renderer (List (Html msg) -> Html msg)
processHtml cardLinks =
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
        , Markdown.Html.tag "tech-icon" TechIcon.icon
            |> Markdown.Html.withAttribute "icon"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "link-card"
            (\imagePosition url style ->
                let
                    styleAttributes =
                        processStyleAttribute (Maybe.withDefault "" style)

                    pos =
                        case imagePosition of
                            Just "top" ->
                                LinkCard.Top

                            Just "left" ->
                                LinkCard.Left

                            Just "right" ->
                                LinkCard.Right

                            Just _ ->
                                LinkCard.Top

                            Nothing ->
                                LinkCard.Top
                in
                LinkCard.render cardLinks pos url styleAttributes
            )
            |> Markdown.Html.withOptionalAttribute "image-position"
            |> Markdown.Html.withAttribute "url"
            |> Markdown.Html.withOptionalAttribute "style"
        ]


customHtmlRenderer : LinkCard.CardLinks -> Renderer (Html msg)
customHtmlRenderer cardLinks =
    { defaultHtmlRenderer
        | image = \{ alt, src, title } -> showImage (Just alt) title Nothing Nothing Nothing src []
        , blockQuote = \content -> showBlockquote Nothing content
        , codeBlock = codeBlock
        , html = processHtml cardLinks
    }


gatherLinks : String -> List String
gatherLinks markdown =
    let
        blocks =
            markdown
                |> Markdown.Parser.parse
                |> Result.mapError (\error -> error |> List.map Markdown.Parser.deadEndToString |> String.join "\n")
                |> (\result ->
                        case result of
                            Ok content ->
                                content

                            Err _ ->
                                []
                   )
    in
    blocks
        |> Markdown.Block.foldl
            (\block list ->
                case block of
                    Markdown.Block.HtmlBlock htmlBlock ->
                        case htmlBlock of
                            Markdown.Block.HtmlElement "link-card" (attr :: _) children ->
                                case attr.name of
                                    "url" ->
                                        attr.value :: list

                                    _ ->
                                        list

                            _ ->
                                list

                    _ ->
                        list
            )
            []


markdownToView : LinkCard.CardLinks -> String -> List (Html msg)
markdownToView cardLinks markdownString =
    markdownString
        |> Markdown.Parser.parse
        |> Result.mapError (\error -> error |> List.map Markdown.Parser.deadEndToString |> String.join "\n")
        |> Result.andThen
            (\blocks ->
                Markdown.Renderer.render
                    (customHtmlRenderer cardLinks)
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


markdownToPlainHtml : String -> String
markdownToPlainHtml markdownString =
    markdownString
        |> Markdown.Parser.parse
        |> Result.withDefault []
        |> Markdown.Renderer.render plainHtmlRenderer
        |> Result.withDefault []
        |> String.join " "
        |> String.replace "  " " "


getAbstract : String -> String
getAbstract body =
    Maybe.withDefault "" <| List.head (String.split "<!--more-->" body)


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


plainHtmlRenderer : Renderer String
plainHtmlRenderer =
    { heading =
        \{ level, children } ->
            case level of
                Markdown.Block.H1 ->
                    "<h1>" ++ String.concat children ++ "</h1>"

                Markdown.Block.H2 ->
                    "<h2>" ++ String.concat children ++ "</h2>"

                Markdown.Block.H3 ->
                    "<h3>" ++ String.concat children ++ "</h3>"

                Markdown.Block.H4 ->
                    "<h4>" ++ String.concat children ++ "</h4>"

                Markdown.Block.H5 ->
                    "<h5>" ++ String.concat children ++ "</h5>"

                Markdown.Block.H6 ->
                    "<h6>" ++ String.concat children ++ "</h6>"
    , paragraph = \text -> "<p>" ++ String.concat text ++ "</p>"
    , hardLineBreak = "<br />"
    , blockQuote = \children -> "<blockquote>" ++ String.concat children ++ "</blockquote>"
    , strong = \children -> "<strong>" ++ String.concat children ++ "</strong>"
    , emphasis = \children -> "<em>" ++ String.concat children ++ "</em>"
    , codeSpan = \children -> "<code>" ++ children ++ "</code>"
    , link = \{ title, destination } content -> "<a title=\"" ++ Maybe.withDefault "" title ++ "href=\"" ++ destination ++ "\">" ++ String.concat content ++ "</a>"
    , image = \{ alt, src, title } -> "<img src=\"" ++ src ++ "\" alt=\"" ++ alt ++ "\" title=\"" ++ Maybe.withDefault "" title ++ "\" />"
    , text = identity
    , unorderedList =
        \items ->
            "<ul>"
                ++ (items
                        |> List.map
                            (\(Markdown.Block.ListItem _ children) ->
                                "<li>" ++ String.concat children ++ "</li>"
                            )
                        |> String.join " "
                   )
                ++ "</ul>"
    , orderedList =
        \startingIndex items ->
            "<ol>"
                ++ (items
                        |> List.indexedMap
                            (\idx itemBlocks ->
                                String.fromInt (idx + startingIndex) ++ ") " ++ String.concat itemBlocks
                            )
                        |> String.join " "
                   )
                ++ "</ol>"
    , html = processHtmlToHtmlCode |> Markdown.Html.map (always String.concat)
    , codeBlock = \{ body, language } -> "<pre><code class=\"" ++ Maybe.withDefault "" language ++ "\">" ++ body ++ "</code></pre>"
    , thematicBreak = "<hr />"
    , table = \content -> "<table>" ++ String.concat content ++ "</table>"
    , tableHeader = \content -> "<thead>" ++ String.concat content ++ "</tead>"
    , tableBody = \content -> "<tbody>" ++ String.concat content ++ "</tbody>"
    , tableRow = \content -> "<tr>" ++ String.concat content ++ "</tr>"
    , tableHeaderCell = \_ content -> "<th>" ++ String.concat content ++ "</th>"
    , tableCell = \_ content -> "<td>" ++ String.concat content ++ "</td>"
    , strikethrough = \text -> "<s>" ++ String.concat text ++ "</s>"
    }


processHtmlToHtmlCode : Markdown.Html.Renderer (String -> String)
processHtmlToHtmlCode =
    Markdown.Html.oneOf
        [ Markdown.Html.tag "div"
            (\class style id children -> "<div class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</div>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "span"
            (\class id children -> "<span class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</span>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "b" (\children -> "<b>" ++ children ++ "</b>")
        , Markdown.Html.tag "em" (\class children -> "<em class=\"" ++ Maybe.withDefault "" class ++ "\"   >" ++ children ++ "</em>") |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "p" (\children -> "<p>" ++ children ++ "</p>")
        , Markdown.Html.tag "blockquote" (\class children -> "<blockquote class=\"" ++ Maybe.withDefault "" class ++ "\"   >" ++ children ++ "</blockquote>") |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "script" (\children -> "<div>" ++ children ++ "</div>")
        , Markdown.Html.tag "a" (\href id target rel children -> "<a href=\"" ++ Maybe.withDefault "" href ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" target=\"" ++ Maybe.withDefault "" target ++ "\" rel=\"" ++ Maybe.withDefault "" rel ++ "\"  >" ++ children ++ "</a>") |> Markdown.Html.withOptionalAttribute "href" |> Markdown.Html.withOptionalAttribute "id" |> Markdown.Html.withOptionalAttribute "target" |> Markdown.Html.withOptionalAttribute "rel"
        , Markdown.Html.tag "iframe"
            (\src width height allow scrolling frameborder style title _ -> "<iframe src=\"" ++ src ++ "\"></iframe>")
            |> Markdown.Html.withAttribute "src"
            |> Markdown.Html.withOptionalAttribute "width"
            |> Markdown.Html.withOptionalAttribute "height"
            |> Markdown.Html.withOptionalAttribute "allow"
            |> Markdown.Html.withOptionalAttribute "scrolling"
            |> Markdown.Html.withOptionalAttribute "frameborder"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "title"
        , Markdown.Html.tag "h1"
            (\class id children -> "<h1 class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</h1>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h2"
            (\class id children -> "<h2 class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</h2>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h3"
            (\class id children -> "<h3 class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</h3>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h4"
            (\class id children -> "<h4 class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</h4>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h5"
            (\class id children -> "<h5 class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</h5>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "h6"
            (\class id children -> "<h6 class=\"" ++ Maybe.withDefault "" class ++ "\"  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</h6>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "table"
            (\class style id children -> "<table class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</table>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "thead"
            (\class style id children -> "<thead class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</thead>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "tbody"
            (\class style id children -> "<tbody class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</tbody>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "th"
            (\class id style colspan children -> "<th class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" colspan=\"" ++ Maybe.withDefault "" colspan ++ "\">" ++ children ++ "</th>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "colspan"
        , Markdown.Html.tag "tr"
            (\class style id children -> "<tr class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</tr>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "td"
            (\class id style colspan children -> "<td class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" colSpan=\"" ++ Maybe.withDefault "" colspan ++ "\">" ++ children ++ "</td>")
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "colspan"
        , Markdown.Html.tag "i" (\children -> "<i>" ++ children ++ "</i>")
        , Markdown.Html.tag "strong" (\children -> "<strong>" ++ children ++ "</strong>")
        , Markdown.Html.tag "br" (\_ -> "<br />")
        , Markdown.Html.tag "li" (\id children -> "<li  id=\"" ++ Maybe.withDefault "" id ++ "\" >" ++ children ++ "</li>") |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "ol" (\children -> "<ol>" ++ children ++ "</ol>")
        , Markdown.Html.tag "ul" (\children -> "<ul>" ++ children ++ "</ul>")
        , Markdown.Html.tag "code" (\class children -> "<pre><code class=\"" ++ Maybe.withDefault "" class ++ "\">" ++ children ++ "</code></pre>") |> Markdown.Html.withOptionalAttribute "class"
        , Markdown.Html.tag "img" (\alt title class style id src _ -> "<img src=\"" ++ src ++ "\" title=\"" ++ Maybe.withDefault "" title ++ "\" alt=\"" ++ Maybe.withDefault "" alt ++ "\" class=\"" ++ Maybe.withDefault "" class ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\" id=\"" ++ Maybe.withDefault "" id ++ "\" />")
            |> Markdown.Html.withOptionalAttribute "alt"
            |> Markdown.Html.withOptionalAttribute "title"
            |> Markdown.Html.withOptionalAttribute "class"
            |> Markdown.Html.withOptionalAttribute "style"
            |> Markdown.Html.withOptionalAttribute "id"
            |> Markdown.Html.withAttribute "src"
        , Markdown.Html.tag "dl" (\children -> "<dl>" ++ children ++ "</dl>")
        , Markdown.Html.tag "dd" (\children -> "<dd>" ++ children ++ "</dd>")
        , Markdown.Html.tag "dt" (\id children -> "<dt id=\"" ++ Maybe.withDefault "" id ++ "\">" ++ children ++ "</dt>") |> Markdown.Html.withOptionalAttribute "id"
        , Markdown.Html.tag "figure" (\children -> "<figure>" ++ children ++ "</figure>")
        , Markdown.Html.tag "figcaption" (\children -> "<figcaption>" ++ children ++ "</figcaption>")
        , Markdown.Html.tag "hr" (\_ -> "<hr />")
        , Markdown.Html.tag "label" (\children -> "<label>" ++ children ++ "</label>")
        , Markdown.Html.tag "easy-like-score" (\likeness easiness _ -> "<div><div>Likeness " ++ likeness ++ "</div><div>Easiness " ++ easiness ++ "</div></div>")
            |> Markdown.Html.withAttribute "likeness"
            |> Markdown.Html.withAttribute "easiness"
        , Markdown.Html.tag "warning" (\children -> "<div class=\"warning-box\">" ++ children ++ "</div>")
        , Markdown.Html.tag "twitter-tweet" (\children -> "<div class=\"tweet\">" ++ children ++ "</div>")
        , Markdown.Html.tag "icon" (\icon text style _ -> "<div class=\"" ++ icon ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\">" ++ Maybe.withDefault "" text ++ "<div>")
            |> Markdown.Html.withAttribute "icon"
            |> Markdown.Html.withOptionalAttribute "text"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "tech-icon" (\icon style _ -> "<div class=\"" ++ icon ++ "\" style=\"" ++ Maybe.withDefault "" style ++ "\">" ++ "<div>")
            |> Markdown.Html.withAttribute "icon"
            |> Markdown.Html.withOptionalAttribute "style"
        , Markdown.Html.tag "link-card" (\url children -> "<a class=\"link-card\" href=\"" ++ url ++ "\">" ++ children ++ "</a>")
            |> Markdown.Html.withAttribute "url"
        ]
