module Route.Cv exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import Components.Icon as Icon
import Components.ManfredLogo as ManfredLogo
import DataModel.CV exposing (AsideProjects(..), CV, Company, Education, Job, PersonalInfo, Role, cvDecoder, sortEducation)
import Date
import Dict exposing (..)
import Effect
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html, th)
import Html.Attributes as Attribute
import Html.Events
import MimeType exposing (MimeType(..))
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Phosphor
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Svg
import UrlPath
import Util.MarkdownProcessor exposing (markdownToView)
import View exposing (View)


type alias Model =
    { selectedSkills : List String }


type Msg
    = ToggleSkill String


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    case msg of
        ToggleSkill tag ->
            ( { model
                | selectedSkills =
                    if List.member tag model.selectedSkills then
                        List.filter (\a -> a /= tag) model.selectedSkills

                    else
                        tag :: model.selectedSkills
              }
            , Effect.none
            )


type alias RouteParams =
    {}


type alias Data =
    { cv : CV
    }


type alias ActionData =
    {}



-- (Decode.at [ "aboutMe", "profile", "name" ] Decode.field))


getRequest : BackendTask FatalError CV
getRequest =
    BackendTask.Http.getJson
        "https://raw.githubusercontent.com/jmtalarn/manfred-cv-json/main/CV/MAC.json"
        cvDecoder
        |> BackendTask.allowFatal


route : RouteBuilder.StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildWithLocalState
            { view = view
            , init = init
            , update = update
            , subscriptions = \_ _ _ _ -> Sub.none
            }


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( { selectedSkills = [] }, Effect.none )


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data |> BackendTask.andMap getRequest



-- |> BackendTask.andMap
--     (BackendTask.succeed "Hello!")


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "jmtalarn.com"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Web developer"
        , locale = Nothing
        , title = "jmtalarn.com ~ CV web developer "
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view app shared { selectedSkills } =
    let
        { personalInfo, experience, education, asideProjects } =
            app.data.cv
    in
    { title = "jmtalarn ~ Web developer { Frontend developer } CV"
    , body =
        [ Html.h1 [] [ Html.text ("~ CV ~ " ++ personalInfo.name ++ " " ++ personalInfo.surnames) ]
        , selectedTags selectedSkills
        , personalInfoSection personalInfo
        , Html.h2 [] [ Html.text "Working experience" ]
        , experienceSection experience selectedSkills
        , Html.h2 [] [ Html.text "Education" ]
        , educationSection (sortEducation education) selectedSkills
        , Html.h2 [] [ Html.text "Aside projects" ]
        , asideProjectsSection asideProjects selectedSkills
        , poweredByManfred
        ]
    }



-- COMPONENTS


selectedTags : List String -> Html (PagesMsg Msg)
selectedTags selectedSkills =
    let
        areThereSkillsSelected =
            List.length selectedSkills > 0
    in
    Html.div
        [ if areThereSkillsSelected then
            Attribute.style "position" "sticky"

          else
            Attribute.style "position" "relative"
        , Attribute.style "min-height" "2rem"
        , Attribute.style "width" "100%"
        , Attribute.style "top" "0"
        , Attribute.style "background" "transparent"
        , Attribute.style "display" "flex"
        , Attribute.style "align-items" "center"
        , Attribute.style "gap" "4px"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "background" "linear-gradient(180deg, rgba(255,255,255,1) 75%, rgba(0,212,255,0) 100%)"
        , Attribute.style "padding" ".4rem 0 1rem 0"

        --, Attribute.style "border" "1px dotted red"
        ]
        (List.append
            (if areThereSkillsSelected then
                [ Icon.fill Phosphor.tag (Just [ Attribute.style "color" "Orange", Attribute.style "font-size" "1rem" ]) ]

             else
                []
            )
            (List.map skillTag selectedSkills)
        )


role : List String -> Role -> Html (PagesMsg Msg)
role selectedSkills { startDate, endDate, name, skills, description_md } =
    Html.div
        [ Attribute.class "role"
        , if isItemHidden selectedSkills skills then
            Attribute.style "display" "none"

          else
            Attribute.style "" ""
        ]
        [ Html.header
            [ Attribute.style "display" "flex"
            , Attribute.style "align-items" "center"
            , Attribute.style "justify-content" "space-between"
            ]
            [ Html.h4 [ Attribute.style "margin" "0" ] [ Html.text name ]
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


skillTag : String -> Html (PagesMsg Msg)
skillTag tag =
    Html.span
        [ Attribute.style "border" "1px solid orange"
        , Attribute.style "border-radius" "10px"
        , Attribute.style "font-size" ".6rem"
        , Attribute.style "padding" "0 4px"
        , Attribute.style "cursor" "pointer"
        , Attribute.style "text-wrap" "nowrap"
        , Attribute.style "display" "inline-block"
        , Html.Events.onClick (PagesMsg.fromMsg <| ToggleSkill tag)
        ]
        [ Html.text tag ]


companyInfo : Company -> Html (PagesMsg Msg)
companyInfo { name, image, url } =
    Html.div
        [ Attribute.class "company"
        , Attribute.style "flex" "1 0 10rem"
        ]
        [ Html.h3
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


isItemHidden : List String -> List String -> Bool
isItemHidden tags skillsOnItem =
    List.length tags > 0 && not (List.any (\skill -> List.member skill tags) skillsOnItem)


jobExperience : List String -> Job -> Html (PagesMsg Msg)
jobExperience selectedSkills { company, roles } =
    let
        skillsOnAllRoles =
            List.concat (List.map (\a -> a.skills) roles)
    in
    Html.article
        [ Attribute.style "display" "flex"
        , Attribute.style "gap" "1rem"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "margin-bottom" "4rem"
        , if isItemHidden selectedSkills skillsOnAllRoles then
            Attribute.style "display" "none"

          else
            Attribute.style "" ""

        --, Attribute.style "margin" "2rem"
        --grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
        ]
        [ companyInfo company
        , Html.div [ Attribute.class "roles", Attribute.style "flex" "1 1 30rem" ] (List.map (role selectedSkills) roles)
        ]


personalInfoSection : PersonalInfo -> Html (PagesMsg Msg)
personalInfoSection pi =
    Html.section
        [ Attribute.style "margin-bottom" "5rem" ]
        [ Html.h2 [] [ Html.text pi.title ]
        , Html.p [] (markdownToView pi.description_md)
        , Html.h4 [] [ Html.text "What I would looking for ? " ]
        , Html.p [] (markdownToView pi.desiredPosition)
        ]


educationItem : List String -> Education -> Html (PagesMsg Msg)
educationItem selectedSkills { category, name, description_md, date, institution, skills } =
    Html.article
        [ Attribute.style "display" "flex"
        , Attribute.style "max-width" "960px"
        , Attribute.style "flex-wrap" "wrap"
        , Attribute.style "margin" "auto 0 4rem"
        , if isItemHidden selectedSkills (Maybe.withDefault [] skills) then
            Attribute.style "display" "none"

          else
            Attribute.style "" ""
        ]
        (List.append
            [ Html.div [ Attribute.style "flex" "1 1 70%" ]
                (Html.header []
                    [ Html.h4
                        [ Attribute.style "margin" "0" ]
                        [ Html.text name ]
                    , Html.div
                        [ Attribute.style "margin" "0"
                        , Attribute.style "display" "flex"
                        , Attribute.style "flex-wrap" "wrap"
                        , Attribute.style "align-items" "center"
                        , Attribute.style "gap" "1rem"
                        ]
                        [ Html.div
                            [ Attribute.style "display" "flex"
                            , Attribute.style "align-items" "center"
                            ]
                            (List.append
                                [ Html.h4
                                    [ Attribute.style "margin" "0" ]
                                    [ Html.text institution.name ]
                                ]
                                (case institution.url of
                                    Just url ->
                                        [ Html.a
                                            [ Attribute.href url ]
                                            [ Icon.light Phosphor.linkSimple (Just [ Attribute.style "height" "1rem" ]) ]
                                        ]

                                    Nothing ->
                                        [ Html.span [] [ Html.text " " ] ]
                                )
                            )
                        , Html.div [ Attribute.style "font-size" "0.8rem" ] [ Html.text (Date.format "MMMM y" date) ]
                        ]
                    ]
                    :: markdownToView
                        (case description_md of
                            Just text ->
                                text

                            Nothing ->
                                ""
                        )
                    ++ [ Html.footer
                            [ Attribute.class "skills"
                            , Attribute.style "display" "flex"
                            , Attribute.style "align-items" "center"
                            , Attribute.style "gap" "4px"
                            , Attribute.style "flex-wrap" "wrap"
                            ]
                            (List.map skillTag (Maybe.withDefault [] skills))
                       ]
                )
            ]
            (case institution.logo of
                Just l ->
                    [ Html.img
                        [ Attribute.src l
                        , Attribute.style "width" "10rem"
                        , Attribute.style "align-self" "center"
                        , Attribute.style "flex" "0 0 auto"
                        ]
                        []
                    ]

                Nothing ->
                    []
            )
        )


educationSection : List Education -> List String -> Html (PagesMsg Msg)
educationSection educations selectedSkills =
    let
        dict =
            List.foldl reduceEducation Dict.empty educations
    in
    Html.div []
        [ Html.section
            [ Attribute.style "display" "flex"
            , Attribute.style "flex-direction" "column"
            , Attribute.style "max-width" "960px"
            , Attribute.style "margin" "0 auto"

            --, Attribute.style "align-items" "center"
            ]
            (Html.h3 [] [ Html.text "Degrees" ]
                :: List.map (educationItem selectedSkills) (Maybe.withDefault [] (Dict.get "officialDegree" dict))
            )
        , Html.section
            [ Attribute.style "display" "flex"
            , Attribute.style "flex-direction" "column"
            , Attribute.style "max-width" "960px"
            , Attribute.style "margin" "0 auto"
            ]
            (Html.h3 [] [ Html.text "Certifications" ]
                :: List.map (educationItem selectedSkills) (Maybe.withDefault [] (Dict.get "certification" dict))
            )
        ]


reduceEducation : Education -> Dict String (List Education) -> Dict String (List Education)
reduceEducation a dict =
    let
        list =
            Dict.get a.category dict

        toInsert =
            case list of
                Just b ->
                    b ++ [ a ]

                Nothing ->
                    [ a ]
    in
    Dict.insert a.category toInsert dict


experienceSection : List Job -> List String -> Html (PagesMsg Msg)
experienceSection experience selectedSkills =
    Html.section
        [ Attribute.style "display" "flex"
        , Attribute.style "flex-direction" "column"
        , Attribute.style "max-width" "960px"
        , Attribute.style "margin" "0 auto"

        --, Attribute.style "align-items" "center"
        ]
        (List.map (jobExperience selectedSkills) experience)


poweredByManfred : Html (PagesMsg Msg)
poweredByManfred =
    Html.div
        [ Attribute.style "display" "flex"
        , Attribute.style "align-items" "start"
        , Attribute.style "gap" "0.5rem"
        , Attribute.style "justify-content" "end"
        ]
        [ Html.span [] [ Html.text "Data powered by" ]
        , Html.div [ Attribute.style "width" "8rem" ] [ ManfredLogo.logo [ Attribute.style "width" "100%", Attribute.style "height" "100%" ] ]
        ]


asideProjectsSection : List AsideProjects -> List String -> Html (PagesMsg Msg)
asideProjectsSection list selectedSkills =
    let
        listStyle =
            [ Attribute.style "list-style-type" "none"
            , Attribute.style "margin" "0"
            , Attribute.style "padding" "0"
            , Attribute.style "display" "grid"
            , Attribute.style "grid-template-columns" "repeat(auto-fit, minmax(15rem, 1fr))"
            , Attribute.style "gap" "1rem"
            ]
    in
    Html.section
        [ Attribute.style "max-width" "960px"
        , Attribute.style "margin" "0 auto"
        ]
        [ Html.ul
            listStyle
            (List.map
                (asideProject selectedSkills)
                list
            )
        ]


asideProject : List String -> AsideProjects -> Html (PagesMsg Msg)
asideProject selectedSkills thing =
    let
        title =
            \t -> Html.h4 [ Attribute.style "margin" "0" ] [ Html.text t ]

        link =
            \l ->
                Html.a
                    [ Attribute.href (Maybe.withDefault "" l)
                    ]
                    [ Icon.light Phosphor.linkSimple (Just [ Attribute.style "height" "1rem" ]) ]

        tags =
            \t ->
                Html.div
                    [ Attribute.class "skills"
                    , Attribute.style "display" "flex"
                    , Attribute.style "align-items" "center"
                    , Attribute.style "gap" "4px"
                    , Attribute.style "flex-wrap" "wrap"
                    , Attribute.style "margin-top" "1rem"
                    ]
                    (List.map skillTag t)

        header =
            \name url ->
                Html.header
                    [ Attribute.style "display" "flex"
                    , Attribute.style "align-items" "center"
                    , Attribute.style "gap" "1rem"
                    ]
                    [ title name
                    , link url
                    ]

        itemStyle skills =
            [ Attribute.style "margin" "2rem 0"
            , if isItemHidden selectedSkills skills then
                Attribute.style "display" "none"

              else
                Attribute.style "" ""
            ]
    in
    case thing of
        AsideProject { name, description_md, dates, skills, url } ->
            let
                ( startDate, maybeEndDate ) =
                    dates
            in
            Html.li
                (itemStyle skills)
                [ header name url
                , Html.p [] (markdownToView description_md)
                , Html.div [ Attribute.style "font-size" "0.8rem" ]
                    [ Html.text (Date.format "MMMM y" startDate)
                    , Html.text " ~ "
                    , Html.text
                        (case maybeEndDate of
                            Just endDate ->
                                Date.format "MMMM y" endDate

                            Nothing ->
                                "Currently"
                        )
                    ]
                , tags skills
                ]

        AsidePublicArtifact { date, description_md, image, name, skills, url } ->
            Html.li
                (itemStyle skills)
                (header name url
                    :: (case image of
                            Just i ->
                                [ Html.img
                                    [ Attribute.src i
                                    , Attribute.style "width" "8rem"
                                    , Attribute.style "display" "block"
                                    , Attribute.style "margin" "0 auto"
                                    , Attribute.style "filter" "drop-shadow(5px 5px 5px dimgray)"
                                    ]
                                    []
                                ]

                            Nothing ->
                                []
                       )
                    ++ [ Html.p [] (markdownToView description_md)
                       , Html.div [ Attribute.style "font-size" "0.8rem" ]
                            [ Html.text (Date.format "MMMM y" date)
                            ]
                       , tags skills
                       ]
                )
