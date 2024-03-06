module DataModel.CV exposing (..)

import Date exposing (Date)
import Iso8601
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Time


type alias CV =
    { personalInfo : PersonalInfo
    , experience : List Job
    }


type alias PersonalInfo =
    { name : String
    , surnames : String
    , title : String
    , description_md : String
    }


type alias Company =
    { name : String
    , image : String
    , url : Maybe String
    }


type alias Role =
    { name : String
    , startDate : Date
    , endDate : Maybe Date
    , description_md : String
    , skills : List String
    }


type alias Job =
    { company : Company
    , roles : List Role
    }


jobDecoder : Decoder Job
jobDecoder =
    Decode.map2 Job
        (Decode.field "organization" companyDecoder)
        (Decode.field "roles" (Decode.list roleDecoder))


companyDecoder : Decoder Company
companyDecoder =
    Decode.map3 Company
        (Decode.field "name" Decode.string)
        (Decode.at [ "image", "link" ] Decode.string)
        (Decode.maybe (Decode.field "URL" Decode.string))


decodeDate : Decoder Date
decodeDate =
    Iso8601.decoder
        |> Decode.map
            (\posix ->
                Date.fromPosix Time.utc posix
            )


roleDecoder : Decoder Role
roleDecoder =
    Decode.map5 Role
        (Decode.field "name" Decode.string)
        (Decode.field "startDate" decodeDate)
        (Decode.maybe (Decode.field "finishDate" decodeDate))
        (Decode.field "challenges" (Decode.index 0 (Decode.field "description" Decode.string)))
        (Decode.field "competences" (Decode.list (Decode.field "name" Decode.string)))


personalInfoDecoder : Decoder PersonalInfo
personalInfoDecoder =
    Decode.map4 PersonalInfo
        (Decode.field "name" Decode.string)
        (Decode.field "surnames" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "description" Decode.string)


cvDecoder : Decoder CV
cvDecoder =
    Decode.map2 CV
        (Decode.at [ "aboutMe", "profile" ] personalInfoDecoder)
        (Decode.at [ "experience", "jobs" ] (Decode.list jobDecoder))
