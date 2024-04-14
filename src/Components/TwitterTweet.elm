module Components.TwitterTweet exposing (..)

import Components.Icons.Icon as Icon
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor


twitterTweet : List (Html msg) -> Html msg
twitterTweet children =
    Html.div
        [ Attribute.class "twitter-tweet"
        , Attribute.style "display" "flex"
        , Attribute.style "align-items" "center"
        , Attribute.style "gap" "1rem"
        , Attribute.style "padding" "1rem"
        , Attribute.style "background-color" "LightCyan"
        , Attribute.style "font-weight" "100"
        , Attribute.style "border-radius" "10px"
        , Attribute.style "border-left" "10px solid SkyBlue"
        ]
        [ Html.span
            [ Attribute.style "color" "blue"
            , Attribute.style "text-shadow" "1px 0px gray"
            , Attribute.style "font-size" "2rem"
            ]
            [ Icon.duotone
                Phosphor.twitterLogo
                (Just [ Attribute.style "font-size" "3rem" ])
            ]
        , Html.div
            [ Attribute.style "line-height" "1.3rem"
            ]
            children
        ]



-- <blockquote class="twitter-tweet" data-lang="en">
-- <p dir="ltr" lang="en">This has to be a record for <a href="https://twitter.com/hashtag/opensource?src=hash">#opensource</a>, "<a href="https://twitter.com/fontawesome">@fontawesome</a> 5" kickstarter: 7,226 backers, $244,363 pledged of $30,000 goal, 35 days to go!
-- — Justin Dorfman (@jdorfman) <a href="https://twitter.com/jdorfman/status/791384038879690752">October 26, 2016</a>
-- </blockquote>
