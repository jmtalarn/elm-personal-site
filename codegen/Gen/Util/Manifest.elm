module Gen.Util.Manifest exposing (manifest, moduleName_, values_)

{-| 
@docs moduleName_, manifest, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Util", "Manifest" ]


{-| manifest: BackendTask.BackendTask error Pages.Manifest.Config -}
manifest : Elm.Expression
manifest =
    Elm.value
        { importFrom = [ "Util", "Manifest" ]
        , name = "manifest"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.var "error"
                    , Type.namedWith [ "Pages", "Manifest" ] "Config" []
                    ]
                )
        }


values_ : { manifest : Elm.Expression }
values_ =
    { manifest =
        Elm.value
            { importFrom = [ "Util", "Manifest" ]
            , name = "manifest"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.var "error"
                        , Type.namedWith [ "Pages", "Manifest" ] "Config" []
                        ]
                    )
            }
    }