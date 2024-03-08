module Components.Cv exposing (..)

import Components.Icon as Icon
import DataModel.CV exposing (Company, Education, Job, PersonalInfo, Role)
import Date
import ErrorPage exposing (Msg)
import Html exposing (Html)
import Html.Attributes as Attribute
import Phosphor
import Util.MarkdownProcessor exposing (markdownToView)


role : Role -> Html msg
role { startDate, endDate, name, skills, description_md } =
    Html.div
        [ Attribute.class "role" ]
        [ Html.header
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            , Attribute.style "justify-content" "space-between"
            ]
            [ Html.h3 [ Attribute.style "margin" "0" ] [ Html.text name ]
            , Html.div [ Attribute.class "dates", Attribute.style "font-size" "0.8rem" ]
                [ Html.span
                    [ Attribute.class "start-date" ]
                    [ Html.text (Date.format "MMMM y" startDate) ]
                , Html.span [] [ Html.text " - " ]
                , Html.span
                    [ Attribute.class "end-date" ]
                    [ Html.text
                        (case endDate of
                            Just date ->
                                Date.format "MMMM y" date

                            Nothing ->
                                "Currently"
                        )
                    ]
                ]
            ]
        , Html.p [ Attribute.style "text-align" "justify" ] (markdownToView description_md)
        , Html.footer
            [ Attribute.class "skills"
            , Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            , Attribute.style "gap" "4px"
            , Attribute.style "flex-wrap" "wrap"
            ]
            (List.map skillTag skills)
        ]


skillTag : String -> Html msg
skillTag tag =
    Html.span
        [ Attribute.style "border" "1px solid orange"
        , Attribute.style "border-radius" "10px"
        , Attribute.style "font-size" ".6rem"
        , Attribute.style "padding" "0 4px"
        , Attribute.style "text-wrap" "nowrap"
        , Attribute.style "display" "inline-block"
        ]
        [ Html.text tag ]


companyInfo : Company -> Html msg
companyInfo { name, image, url } =
    Html.div
        [ Attribute.class "company"
        , Attribute.style "flex" "1 0 10rem"
        ]
        [ Html.h2
            [ Attribute.style "margin-top" "0" ]
            [ Html.text name ]
        , Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            , Attribute.style "gap" "1rem"
            ]
            [ Html.img
                [ Attribute.src image
                , Attribute.style "max-height" "4rem"
                , Attribute.style "max-width" "6rem"
                ]
                []
            , Html.a
                [ Attribute.href (Maybe.withDefault "" url)
                ]
                [ Icon.light Phosphor.linkSimple (Just [ Attribute.style "height" "1rem" ]) ]
            ]
        ]


jobExperience : Job -> Html msg
jobExperience { company, roles } =
    Html.article
        [ Attribute.style "display" "flex"
        , Attribute.style "gap" "1rem"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "margin" "2rem"

        --grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
        ]
        [ companyInfo company
        , Html.div [ Attribute.class "roles", Attribute.style "flex" "1 1 30rem" ] (List.map role roles)
        ]


personalInfoSection : PersonalInfo -> Html msg
personalInfoSection pi =
    Html.section
        []
        [ Html.h2 [] [ Html.text (pi.name ++ " " ++ pi.surnames) ]
        , Html.h3 [] [ Html.text pi.title ]
        , Html.p [] (markdownToView pi.description_md)
        ]


education : Education -> Html msg
education data =
    Html.article
        [ Attribute.style "display" "flex"
        , Attribute.style "gap" "1rem"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "margin" "2rem"

        --grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
        ]
        [ Html.h1 [] [ Html.text data.name ]
        ]


educationSection : List Education -> Html msg
educationSection educations =
    Html.section
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "column"
        , Attribute.style "max-width" "960px"
        , Attribute.style "margin" "0 auto"

        --, Attribute.style "align-items" "center"
        ]
        (List.map education educations)


experienceSection : List Job -> Html msg
experienceSection experience =
    Html.section
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "column"
        , Attribute.style "max-width" "960px"
        , Attribute.style "margin" "0 auto"

        --, Attribute.style "align-items" "center"
        ]
        (List.map jobExperience experience)
