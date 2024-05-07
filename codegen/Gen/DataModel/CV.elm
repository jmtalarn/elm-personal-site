module Gen.DataModel.CV exposing (annotation_, asideProjectDecoder, asidePublicArtifactDecoder, call_, caseOf_, companyDecoder, cvDecoder, decodeDate, educationDecoder, institutionDecoder, jobDecoder, make_, moduleName_, personalInfoDecoder, projectDecoder, publicArtifactDecoder, roleDecoder, sortEducation, values_)

{-| 
@docs moduleName_, sortEducation, cvDecoder, personalInfoDecoder, roleDecoder, decodeDate, companyDecoder, jobDecoder, institutionDecoder, educationDecoder, publicArtifactDecoder, projectDecoder, asideProjectDecoder, asidePublicArtifactDecoder, annotation_, make_, caseOf_, call_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "DataModel", "CV" ]


{-| sortEducation: List DataModel.CV.Education -> List DataModel.CV.Education -}
sortEducation : List Elm.Expression -> Elm.Expression
sortEducation sortEducationArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "sortEducation"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [ "DataModel", "CV" ] "Education" []
                            )
                        ]
                        (Type.list
                            (Type.namedWith [ "DataModel", "CV" ] "Education" []
                            )
                        )
                    )
            }
        )
        [ Elm.list sortEducationArg ]


{-| cvDecoder: Json.Decode.Decoder DataModel.CV.CV -}
cvDecoder : Elm.Expression
cvDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "cvDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "CV" [] ]
                )
        }


{-| personalInfoDecoder: Json.Decode.Decoder DataModel.CV.PersonalInfo -}
personalInfoDecoder : Elm.Expression
personalInfoDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "personalInfoDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "PersonalInfo" [] ]
                )
        }


{-| roleDecoder: Json.Decode.Decoder DataModel.CV.Role -}
roleDecoder : Elm.Expression
roleDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "roleDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "Role" [] ]
                )
        }


{-| decodeDate: Json.Decode.Decoder Date.Date -}
decodeDate : Elm.Expression
decodeDate =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "decodeDate"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "Date" ] "Date" [] ]
                )
        }


{-| companyDecoder: Json.Decode.Decoder DataModel.CV.Company -}
companyDecoder : Elm.Expression
companyDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "companyDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "Company" [] ]
                )
        }


{-| jobDecoder: Json.Decode.Decoder DataModel.CV.Job -}
jobDecoder : Elm.Expression
jobDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "jobDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "Job" [] ]
                )
        }


{-| institutionDecoder: Json.Decode.Decoder DataModel.CV.Institution -}
institutionDecoder : Elm.Expression
institutionDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "institutionDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "Institution" [] ]
                )
        }


{-| educationDecoder: Json.Decode.Decoder DataModel.CV.Education -}
educationDecoder : Elm.Expression
educationDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "educationDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "Education" [] ]
                )
        }


{-| publicArtifactDecoder: Json.Decode.Decoder DataModel.CV.PublicArtifact -}
publicArtifactDecoder : Elm.Expression
publicArtifactDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "publicArtifactDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "PublicArtifact" [] ]
                )
        }


{-| projectDecoder: Json.Decode.Decoder DataModel.CV.Project -}
projectDecoder : Elm.Expression
projectDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "projectDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "Project" [] ]
                )
        }


{-| asideProjectDecoder: Json.Decode.Decoder DataModel.CV.AsideProjects -}
asideProjectDecoder : Elm.Expression
asideProjectDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "asideProjectDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "AsideProjects" [] ]
                )
        }


{-| asidePublicArtifactDecoder: Json.Decode.Decoder DataModel.CV.AsideProjects -}
asidePublicArtifactDecoder : Elm.Expression
asidePublicArtifactDecoder =
    Elm.value
        { importFrom = [ "DataModel", "CV" ]
        , name = "asidePublicArtifactDecoder"
        , annotation =
            Just
                (Type.namedWith
                    [ "Json", "Decode" ]
                    "Decoder"
                    [ Type.namedWith [ "DataModel", "CV" ] "AsideProjects" [] ]
                )
        }


annotation_ :
    { publicArtifact : Type.Annotation
    , project : Type.Annotation
    , education : Type.Annotation
    , institution : Type.Annotation
    , job : Type.Annotation
    , role : Type.Annotation
    , company : Type.Annotation
    , personalInfo : Type.Annotation
    , cV : Type.Annotation
    , asideProjects : Type.Annotation
    }
annotation_ =
    { publicArtifact =
        Type.alias
            moduleName_
            "PublicArtifact"
            []
            (Type.record
                [ ( "name", Type.string )
                , ( "description_md", Type.string )
                , ( "url", Type.maybe Type.string )
                , ( "skills", Type.list Type.string )
                , ( "image", Type.maybe Type.string )
                , ( "date", Type.namedWith [ "Date" ] "Date" [] )
                ]
            )
    , project =
        Type.alias
            moduleName_
            "Project"
            []
            (Type.record
                [ ( "name", Type.string )
                , ( "description_md", Type.string )
                , ( "url", Type.maybe Type.string )
                , ( "skills", Type.list Type.string )
                , ( "dates"
                  , Type.tuple
                        (Type.namedWith [ "Date" ] "Date" [])
                        (Type.maybe (Type.namedWith [ "Date" ] "Date" []))
                  )
                ]
            )
    , education =
        Type.alias
            moduleName_
            "Education"
            []
            (Type.record
                [ ( "category", Type.string )
                , ( "name", Type.string )
                , ( "description_md", Type.maybe Type.string )
                , ( "date", Type.namedWith [ "Date" ] "Date" [] )
                , ( "institution"
                  , Type.namedWith [ "DataModel", "CV" ] "Institution" []
                  )
                , ( "skills", Type.maybe (Type.list Type.string) )
                ]
            )
    , institution =
        Type.alias
            moduleName_
            "Institution"
            []
            (Type.record
                [ ( "name", Type.string )
                , ( "logo", Type.maybe Type.string )
                , ( "url", Type.maybe Type.string )
                ]
            )
    , job =
        Type.alias
            moduleName_
            "Job"
            []
            (Type.record
                [ ( "company"
                  , Type.namedWith [ "DataModel", "CV" ] "Company" []
                  )
                , ( "roles"
                  , Type.list (Type.namedWith [ "DataModel", "CV" ] "Role" [])
                  )
                ]
            )
    , role =
        Type.alias
            moduleName_
            "Role"
            []
            (Type.record
                [ ( "name", Type.string )
                , ( "startDate", Type.namedWith [ "Date" ] "Date" [] )
                , ( "endDate"
                  , Type.maybe (Type.namedWith [ "Date" ] "Date" [])
                  )
                , ( "description_md", Type.string )
                , ( "skills", Type.list Type.string )
                ]
            )
    , company =
        Type.alias
            moduleName_
            "Company"
            []
            (Type.record
                [ ( "name", Type.string )
                , ( "image", Type.string )
                , ( "url", Type.maybe Type.string )
                ]
            )
    , personalInfo =
        Type.alias
            moduleName_
            "PersonalInfo"
            []
            (Type.record
                [ ( "name", Type.string )
                , ( "surnames", Type.string )
                , ( "title", Type.string )
                , ( "description_md", Type.string )
                , ( "desiredPosition", Type.string )
                ]
            )
    , cV =
        Type.alias
            moduleName_
            "CV"
            []
            (Type.record
                [ ( "personalInfo"
                  , Type.namedWith [ "DataModel", "CV" ] "PersonalInfo" []
                  )
                , ( "experience"
                  , Type.list (Type.namedWith [ "DataModel", "CV" ] "Job" [])
                  )
                , ( "education"
                  , Type.list
                        (Type.namedWith [ "DataModel", "CV" ] "Education" [])
                  )
                , ( "asideProjects"
                  , Type.list
                        (Type.namedWith [ "DataModel", "CV" ] "AsideProjects" []
                        )
                  )
                ]
            )
    , asideProjects = Type.namedWith [ "DataModel", "CV" ] "AsideProjects" []
    }


make_ :
    { publicArtifact :
        { name : Elm.Expression
        , description_md : Elm.Expression
        , url : Elm.Expression
        , skills : Elm.Expression
        , image : Elm.Expression
        , date : Elm.Expression
        }
        -> Elm.Expression
    , project :
        { name : Elm.Expression
        , description_md : Elm.Expression
        , url : Elm.Expression
        , skills : Elm.Expression
        , dates : Elm.Expression
        }
        -> Elm.Expression
    , education :
        { category : Elm.Expression
        , name : Elm.Expression
        , description_md : Elm.Expression
        , date : Elm.Expression
        , institution : Elm.Expression
        , skills : Elm.Expression
        }
        -> Elm.Expression
    , institution :
        { name : Elm.Expression, logo : Elm.Expression, url : Elm.Expression }
        -> Elm.Expression
    , job :
        { company : Elm.Expression, roles : Elm.Expression } -> Elm.Expression
    , role :
        { name : Elm.Expression
        , startDate : Elm.Expression
        , endDate : Elm.Expression
        , description_md : Elm.Expression
        , skills : Elm.Expression
        }
        -> Elm.Expression
    , company :
        { name : Elm.Expression, image : Elm.Expression, url : Elm.Expression }
        -> Elm.Expression
    , personalInfo :
        { name : Elm.Expression
        , surnames : Elm.Expression
        , title : Elm.Expression
        , description_md : Elm.Expression
        , desiredPosition : Elm.Expression
        }
        -> Elm.Expression
    , cV :
        { personalInfo : Elm.Expression
        , experience : Elm.Expression
        , education : Elm.Expression
        , asideProjects : Elm.Expression
        }
        -> Elm.Expression
    , asideProject : Elm.Expression -> Elm.Expression
    , asidePublicArtifact : Elm.Expression -> Elm.Expression
    }
make_ =
    { publicArtifact =
        \publicArtifact_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "PublicArtifact"
                    []
                    (Type.record
                        [ ( "name", Type.string )
                        , ( "description_md", Type.string )
                        , ( "url", Type.maybe Type.string )
                        , ( "skills", Type.list Type.string )
                        , ( "image", Type.maybe Type.string )
                        , ( "date", Type.namedWith [ "Date" ] "Date" [] )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "name" publicArtifact_args.name
                    , Tuple.pair
                        "description_md"
                        publicArtifact_args.description_md
                    , Tuple.pair "url" publicArtifact_args.url
                    , Tuple.pair "skills" publicArtifact_args.skills
                    , Tuple.pair "image" publicArtifact_args.image
                    , Tuple.pair "date" publicArtifact_args.date
                    ]
                )
    , project =
        \project_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "Project"
                    []
                    (Type.record
                        [ ( "name", Type.string )
                        , ( "description_md", Type.string )
                        , ( "url", Type.maybe Type.string )
                        , ( "skills", Type.list Type.string )
                        , ( "dates"
                          , Type.tuple
                                (Type.namedWith [ "Date" ] "Date" [])
                                (Type.maybe
                                    (Type.namedWith [ "Date" ] "Date" [])
                                )
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "name" project_args.name
                    , Tuple.pair "description_md" project_args.description_md
                    , Tuple.pair "url" project_args.url
                    , Tuple.pair "skills" project_args.skills
                    , Tuple.pair "dates" project_args.dates
                    ]
                )
    , education =
        \education_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "Education"
                    []
                    (Type.record
                        [ ( "category", Type.string )
                        , ( "name", Type.string )
                        , ( "description_md", Type.maybe Type.string )
                        , ( "date", Type.namedWith [ "Date" ] "Date" [] )
                        , ( "institution"
                          , Type.namedWith
                                [ "DataModel", "CV" ]
                                "Institution"
                                []
                          )
                        , ( "skills", Type.maybe (Type.list Type.string) )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "category" education_args.category
                    , Tuple.pair "name" education_args.name
                    , Tuple.pair "description_md" education_args.description_md
                    , Tuple.pair "date" education_args.date
                    , Tuple.pair "institution" education_args.institution
                    , Tuple.pair "skills" education_args.skills
                    ]
                )
    , institution =
        \institution_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "Institution"
                    []
                    (Type.record
                        [ ( "name", Type.string )
                        , ( "logo", Type.maybe Type.string )
                        , ( "url", Type.maybe Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "name" institution_args.name
                    , Tuple.pair "logo" institution_args.logo
                    , Tuple.pair "url" institution_args.url
                    ]
                )
    , job =
        \job_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "Job"
                    []
                    (Type.record
                        [ ( "company"
                          , Type.namedWith [ "DataModel", "CV" ] "Company" []
                          )
                        , ( "roles"
                          , Type.list
                                (Type.namedWith [ "DataModel", "CV" ] "Role" [])
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "company" job_args.company
                    , Tuple.pair "roles" job_args.roles
                    ]
                )
    , role =
        \role_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "Role"
                    []
                    (Type.record
                        [ ( "name", Type.string )
                        , ( "startDate", Type.namedWith [ "Date" ] "Date" [] )
                        , ( "endDate"
                          , Type.maybe (Type.namedWith [ "Date" ] "Date" [])
                          )
                        , ( "description_md", Type.string )
                        , ( "skills", Type.list Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "name" role_args.name
                    , Tuple.pair "startDate" role_args.startDate
                    , Tuple.pair "endDate" role_args.endDate
                    , Tuple.pair "description_md" role_args.description_md
                    , Tuple.pair "skills" role_args.skills
                    ]
                )
    , company =
        \company_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "Company"
                    []
                    (Type.record
                        [ ( "name", Type.string )
                        , ( "image", Type.string )
                        , ( "url", Type.maybe Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "name" company_args.name
                    , Tuple.pair "image" company_args.image
                    , Tuple.pair "url" company_args.url
                    ]
                )
    , personalInfo =
        \personalInfo_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "PersonalInfo"
                    []
                    (Type.record
                        [ ( "name", Type.string )
                        , ( "surnames", Type.string )
                        , ( "title", Type.string )
                        , ( "description_md", Type.string )
                        , ( "desiredPosition", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "name" personalInfo_args.name
                    , Tuple.pair "surnames" personalInfo_args.surnames
                    , Tuple.pair "title" personalInfo_args.title
                    , Tuple.pair
                        "description_md"
                        personalInfo_args.description_md
                    , Tuple.pair
                        "desiredPosition"
                        personalInfo_args.desiredPosition
                    ]
                )
    , cV =
        \cV_args ->
            Elm.withType
                (Type.alias
                    [ "DataModel", "CV" ]
                    "CV"
                    []
                    (Type.record
                        [ ( "personalInfo"
                          , Type.namedWith
                                [ "DataModel", "CV" ]
                                "PersonalInfo"
                                []
                          )
                        , ( "experience"
                          , Type.list
                                (Type.namedWith [ "DataModel", "CV" ] "Job" [])
                          )
                        , ( "education"
                          , Type.list
                                (Type.namedWith
                                    [ "DataModel", "CV" ]
                                    "Education"
                                    []
                                )
                          )
                        , ( "asideProjects"
                          , Type.list
                                (Type.namedWith
                                    [ "DataModel", "CV" ]
                                    "AsideProjects"
                                    []
                                )
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "personalInfo" cV_args.personalInfo
                    , Tuple.pair "experience" cV_args.experience
                    , Tuple.pair "education" cV_args.education
                    , Tuple.pair "asideProjects" cV_args.asideProjects
                    ]
                )
    , asideProject =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "DataModel", "CV" ]
                    , name = "AsideProject"
                    , annotation = Just (Type.namedWith [] "AsideProjects" [])
                    }
                )
                [ ar0 ]
    , asidePublicArtifact =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "DataModel", "CV" ]
                    , name = "AsidePublicArtifact"
                    , annotation = Just (Type.namedWith [] "AsideProjects" [])
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { asideProjects :
        Elm.Expression
        -> { asideProjectsTags_0_0
            | asideProject : Elm.Expression -> Elm.Expression
            , asidePublicArtifact : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { asideProjects =
        \asideProjectsExpression asideProjectsTags ->
            Elm.Case.custom
                asideProjectsExpression
                (Type.namedWith [ "DataModel", "CV" ] "AsideProjects" [])
                [ Elm.Case.branch1
                    "AsideProject"
                    ( "dataModelCVProject"
                    , Type.namedWith [ "DataModel", "CV" ] "Project" []
                    )
                    asideProjectsTags.asideProject
                , Elm.Case.branch1
                    "AsidePublicArtifact"
                    ( "dataModelCVPublicArtifact"
                    , Type.namedWith [ "DataModel", "CV" ] "PublicArtifact" []
                    )
                    asideProjectsTags.asidePublicArtifact
                ]
    }


call_ : { sortEducation : Elm.Expression -> Elm.Expression }
call_ =
    { sortEducation =
        \sortEducationArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "DataModel", "CV" ]
                    , name = "sortEducation"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "DataModel", "CV" ]
                                        "Education"
                                        []
                                    )
                                ]
                                (Type.list
                                    (Type.namedWith
                                        [ "DataModel", "CV" ]
                                        "Education"
                                        []
                                    )
                                )
                            )
                    }
                )
                [ sortEducationArg ]
    }


values_ :
    { sortEducation : Elm.Expression
    , cvDecoder : Elm.Expression
    , personalInfoDecoder : Elm.Expression
    , roleDecoder : Elm.Expression
    , decodeDate : Elm.Expression
    , companyDecoder : Elm.Expression
    , jobDecoder : Elm.Expression
    , institutionDecoder : Elm.Expression
    , educationDecoder : Elm.Expression
    , publicArtifactDecoder : Elm.Expression
    , projectDecoder : Elm.Expression
    , asideProjectDecoder : Elm.Expression
    , asidePublicArtifactDecoder : Elm.Expression
    }
values_ =
    { sortEducation =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "sortEducation"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [ "DataModel", "CV" ] "Education" []
                            )
                        ]
                        (Type.list
                            (Type.namedWith [ "DataModel", "CV" ] "Education" []
                            )
                        )
                    )
            }
    , cvDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "cvDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "CV" [] ]
                    )
            }
    , personalInfoDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "personalInfoDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "PersonalInfo" []
                        ]
                    )
            }
    , roleDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "roleDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "Role" [] ]
                    )
            }
    , decodeDate =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "decodeDate"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "Date" ] "Date" [] ]
                    )
            }
    , companyDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "companyDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "Company" [] ]
                    )
            }
    , jobDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "jobDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "Job" [] ]
                    )
            }
    , institutionDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "institutionDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "Institution" []
                        ]
                    )
            }
    , educationDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "educationDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "Education" [] ]
                    )
            }
    , publicArtifactDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "publicArtifactDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith
                            [ "DataModel", "CV" ]
                            "PublicArtifact"
                            []
                        ]
                    )
            }
    , projectDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "projectDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith [ "DataModel", "CV" ] "Project" [] ]
                    )
            }
    , asideProjectDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "asideProjectDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith
                            [ "DataModel", "CV" ]
                            "AsideProjects"
                            []
                        ]
                    )
            }
    , asidePublicArtifactDecoder =
        Elm.value
            { importFrom = [ "DataModel", "CV" ]
            , name = "asidePublicArtifactDecoder"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Json", "Decode" ]
                        "Decoder"
                        [ Type.namedWith
                            [ "DataModel", "CV" ]
                            "AsideProjects"
                            []
                        ]
                    )
            }
    }