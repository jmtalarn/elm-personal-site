module Components.CompanySkillHighlight exposing (companySkillHighlight)

import Components.Icons.Home as HomeIcon
import DataModel.CV exposing (Job)
import Dict
import Html exposing (Html)
import Html.Attributes as Attribute


companySkillHighlight : Job -> Html msg
companySkillHighlight { company, roles } =
    let
        grabbedSkills =
            List.concat (List.map .skills roles)
    in
    Html.div
        [ -- Attribute.style "border" "1px solid salmon",
          Attribute.style "border-radius" "15px"

        -- , Attribute.style "margin" "1rem 2rem 1rem 2rem"
        , Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "column"
        , Attribute.style "align-items" "center"
        , Attribute.style "width" "100%"
        , Attribute.style "flex" "1 0 100%"
        ]
        [ Html.div
            [ Attribute.style "margin" "1rem"
            ]
            [ Html.img
                [ Attribute.style "width" "100%"
                , Attribute.style "max-height" "10rem"
                , Attribute.style "max-width" "15rem"
                , Attribute.src company.image
                , Attribute.alt company.name
                ]
                []
            ]
        , Html.div
            [ Attribute.style "display" "flex"
            , Attribute.style "flex-wrap" "wrap"
            , Attribute.style "align-items" "center"
            , Attribute.style "justify-content" "center"
            , Attribute.style "gap" "1rem"
            , Attribute.style "padding" "1rem"
            ]
            (List.map
                (\skill ->
                    case Dict.get skill skillLogoMap of
                        Just icon ->
                            Html.span
                                [ Attribute.style "font-size" ".8rem"

                                --, Attribute.style "font-weight" "bold"
                                , Attribute.style "font-family" "monospace"
                                , Attribute.style "display" "flex"
                                , Attribute.style "flex-direction" "column"
                                , Attribute.style "align-items" "center"
                                ]
                                [ icon [ Attribute.style "height" "2.5rem", Attribute.style "width" "auto", Attribute.title skill ]
                                , Html.text skill
                                ]

                        Nothing ->
                            Html.span
                                [ Attribute.style "font-size" ".8rem"

                                --, Attribute.style "font-weight" "bold"
                                , Attribute.style "font-family" "monospace"
                                , Attribute.style "display" "flex"
                                , Attribute.style "flex-direction" "column"
                                , Attribute.style "align-items" "center"
                                ]
                                [ Html.span
                                    [ Attribute.style "font-size" "1.2rem"
                                    , Attribute.style "font-weight" "bold"
                                    , Attribute.style "font-family" "monospace"
                                    , Attribute.style "height" "2.5rem"
                                    , Attribute.style "display" "flex"
                                    , Attribute.style "align-items" "center"
                                    ]
                                    [ Html.text skill ]
                                , Html.text skill
                                ]
                )
                grabbedSkills
            )
        ]


skillLogoMap : Dict.Dict String (List (Html.Attribute msg) -> Html msg)
skillLogoMap =
    Dict.fromList
        [ ( "WebComponents", HomeIcon.webcomponents )
        , ( "TypeScript", HomeIcon.typescript )
        , ( "Swing", HomeIcon.java )
        , ( "Styled Components", HomeIcon.styledComponents )
        , ( "Struts", HomeIcon.struts )
        , ( "SQLServer", HomeIcon.sql )
        , ( "SQL", HomeIcon.sql )
        , ( "Spring", HomeIcon.spring )
        , ( "Spring Boot", HomeIcon.spring )
        , ( "SonarQube", HomeIcon.sonarqube )
        , ( "Scss", HomeIcon.sass )
        , ( "Sass", HomeIcon.sass )
        , ( "Redux", HomeIcon.redux )
        , ( "React", HomeIcon.react )
        , ( "Primefaces", HomeIcon.primefaces )
        , ( "Oracle", HomeIcon.sql )
        , ( "NodeJS", HomeIcon.nodejs )
        , ( "MongoDB", HomeIcon.mongodb )
        , ( "MarionetteJS", HomeIcon.marionettejs )
        , ( "JSP", HomeIcon.java )
        , ( "Jenkins", HomeIcon.jenkins )
        , ( "JBoss", HomeIcon.jboss )
        , ( "JavaScript", HomeIcon.javascript )
        , ( "JAVA", HomeIcon.java )
        , ( "HTML", HomeIcon.html5 )
        , ( "Hibernate", HomeIcon.hibernate )
        , ( "GraphQL", HomeIcon.graphql )
        , ( "Git", HomeIcon.git )
        , ( "Express", HomeIcon.express )
        , ( "Docker", HomeIcon.docker )
        , ( "CSS", HomeIcon.css3 )
        , ( "Backbone", HomeIcon.backbone )
        , ( "AWS", HomeIcon.aws )
        , ( "AngularJS", HomeIcon.angular )
        , ( "Angular2+", HomeIcon.angular )
        ]
