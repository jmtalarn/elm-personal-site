module Gen.Components.CompanySkillHighlight exposing (call_, companySkillHighlight, moduleName_, values_)

{-| 
@docs moduleName_, companySkillHighlight, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Components", "CompanySkillHighlight" ]


{-| companySkillHighlight: DataModel.CV.Job -> Html.Html msg -}
companySkillHighlight : Elm.Expression -> Elm.Expression
companySkillHighlight companySkillHighlightArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Components", "CompanySkillHighlight" ]
            , name = "companySkillHighlight"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "DataModel", "CV" ] "Job" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ companySkillHighlightArg ]


call_ : { companySkillHighlight : Elm.Expression -> Elm.Expression }
call_ =
    { companySkillHighlight =
        \companySkillHighlightArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Components", "CompanySkillHighlight" ]
                    , name = "companySkillHighlight"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "DataModel", "CV" ] "Job" []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ companySkillHighlightArg ]
    }


values_ : { companySkillHighlight : Elm.Expression }
values_ =
    { companySkillHighlight =
        Elm.value
            { importFrom = [ "Components", "CompanySkillHighlight" ]
            , name = "companySkillHighlight"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "DataModel", "CV" ] "Job" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }