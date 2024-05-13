module Components.Book.APIData exposing (AmazonPAAPIResponse, AmazonPAAPIResponseItemsResultItems, amazonPAAPIResponseDecoder)

import Json.Decode
import Json.Encode



-- Required packages:
-- * elm/json


type alias AmazonPAAPIResponse =
    { itemsResult : AmazonPAAPIResponseItemsResult
    }


type alias AmazonPAAPIResponseItemsResult =
    { items : List AmazonPAAPIResponseItemsResultItems
    }


type AmazonPAAPIResponseItemsResultItems
    = AmazonPAAPIResponseItemsResultItems0 AmazonPAAPIResponseItemsResultItemsObject
    | AmazonPAAPIResponseItemsResultItems1 AmazonPAAPIResponseItemsResultItemsMember


type alias AmazonPAAPIResponseItemsResultItemsObject =
    { aSIN : String
    , browseNodeInfo : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo
    , detailPageURL : String
    , images : AmazonPAAPIResponseItemsResultItemsObjectImages
    , itemInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfo
    , offers : AmazonPAAPIResponseItemsResultItemsObjectOffers
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo =
    { browseNodes : List AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes
    , websiteSalesRank : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank
    }


type AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes
    = AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes0 AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject
    | AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes1 AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember


type alias AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject =
    { contextFreeName : String
    , displayName : String
    , id : String
    , isRoot : Bool
    , salesRank : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember =
    { contextFreeName : String
    , displayName : String
    , id : String
    , isRoot : Bool
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank =
    { salesRank : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectImages =
    { primary : AmazonPAAPIResponseItemsResultItemsObjectImagesPrimary
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectImagesPrimary =
    { large : AmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge =
    { height : Int
    , url : String
    , width : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfo =
    { byLineInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo
    , contentInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo
    , productInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo
    , technicalInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo
    , title : AmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo =
    { contributors : List AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject =
    { locale : String
    , name : String
    , role : String
    , roleType : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo =
    { edition : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition
    , languages : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages
    , pagesCount : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount
    , publicationDate : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages =
    { displayValues : List AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject =
    { displayValue : String
    , type_ : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount =
    { displayValue : Int
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo =
    { isAdultProduct : AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct
    , releaseDate : AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct =
    { displayValue : Bool
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo =
    { formats : AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats =
    { displayValues : List String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffers =
    { listings : List AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject
    , summaries : List AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject =
    { availability : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability
    , deliveryInfo : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo
    , id : String
    , price : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice
    , violatesMAP : Bool
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability =
    { message : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo =
    { isAmazonFulfilled : Bool
    , isFreeShippingEligible : Bool
    , isPrimeEligible : Bool
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice =
    { amount : Int
    , currency : String
    , displayAmount : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject =
    { condition : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition
    , highestPrice : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice
    , lowestPrice : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice
    , offerCount : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition =
    { value : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice =
    { amount : Int
    , currency : String
    , displayAmount : String
    }


type alias AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice =
    { amount : Int
    , currency : String
    , displayAmount : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMember =
    { aSIN : String
    , browseNodeInfo : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo
    , detailPageURL : String
    , images : AmazonPAAPIResponseItemsResultItemsMemberImages
    , itemInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfo
    , offers : AmazonPAAPIResponseItemsResultItemsMemberOffers
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo =
    { browseNodes : List AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes
    , websiteSalesRank : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank
    }


type AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes
    = AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes0 AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject
    | AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes1 AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember


type alias AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject =
    { contextFreeName : String
    , displayName : String
    , id : String
    , isRoot : Bool
    , salesRank : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember =
    { contextFreeName : String
    , displayName : String
    , id : String
    , isRoot : Bool
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank =
    { salesRank : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberImages =
    { primary : AmazonPAAPIResponseItemsResultItemsMemberImagesPrimary
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberImagesPrimary =
    { large : AmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge =
    { height : Int
    , url : String
    , width : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfo =
    { byLineInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo
    , contentInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo
    , productInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo
    , title : AmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo =
    { contributors : List AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject
    , manufacturer : AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject =
    { locale : String
    , name : String
    , role : String
    , roleType : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo =
    { languages : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages
    , pagesCount : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount
    , publicationDate : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages =
    { displayValues : List AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject =
    { displayValue : String
    , type_ : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount =
    { displayValue : Int
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo =
    { isAdultProduct : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct
    , itemDimensions : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct =
    { displayValue : Bool
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions =
    { height : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight
    , length : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength
    , width : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight =
    { displayValue : Int
    , label : String
    , locale : String
    , unit : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength =
    { displayValue : Int
    , label : String
    , locale : String
    , unit : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth =
    { displayValue : Float
    , label : String
    , locale : String
    , unit : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffers =
    { listings : List AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject
    , summaries : List AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject =
    { availability : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability
    , deliveryInfo : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo
    , id : String
    , price : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice
    , violatesMAP : Bool
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability =
    { message : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo =
    { isAmazonFulfilled : Bool
    , isFreeShippingEligible : Bool
    , isPrimeEligible : Bool
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice =
    { amount : Int
    , currency : String
    , displayAmount : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject =
    { condition : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition
    , highestPrice : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice
    , lowestPrice : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice
    , offerCount : Int
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition =
    { value : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice =
    { amount : Int
    , currency : String
    , displayAmount : String
    }


type alias AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice =
    { amount : Int
    , currency : String
    , displayAmount : String
    }


amazonPAAPIResponseDecoder : Json.Decode.Decoder AmazonPAAPIResponse
amazonPAAPIResponseDecoder =
    Json.Decode.map AmazonPAAPIResponse
        (Json.Decode.field "ItemsResult" amazonPAAPIResponseItemsResultDecoder)


amazonPAAPIResponseItemsResultDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResult
amazonPAAPIResponseItemsResultDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResult
        (Json.Decode.field "Items" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsItemDecoder)


amazonPAAPIResponseItemsResultItemsItemDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItems
amazonPAAPIResponseItemsResultItemsItemDecoder =
    Json.Decode.oneOf
        [ Json.Decode.map AmazonPAAPIResponseItemsResultItems0 <| amazonPAAPIResponseItemsResultItemsObjectDecoder
        , Json.Decode.map AmazonPAAPIResponseItemsResultItems1 <| amazonPAAPIResponseItemsResultItemsMemberDecoder
        ]


amazonPAAPIResponseItemsResultItemsObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObject
amazonPAAPIResponseItemsResultItemsObjectDecoder =
    Json.Decode.map6 AmazonPAAPIResponseItemsResultItemsObject
        (Json.Decode.field "ASIN" Json.Decode.string)
        (Json.Decode.field "BrowseNodeInfo" amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoDecoder)
        (Json.Decode.field "DetailPageURL" Json.Decode.string)
        (Json.Decode.field "Images" amazonPAAPIResponseItemsResultItemsObjectImagesDecoder)
        (Json.Decode.field "ItemInfo" amazonPAAPIResponseItemsResultItemsObjectItemInfoDecoder)
        (Json.Decode.field "Offers" amazonPAAPIResponseItemsResultItemsObjectOffersDecoder)


amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo
amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo
        (Json.Decode.field "BrowseNodes" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesItemDecoder)
        (Json.Decode.field "WebsiteSalesRank" amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRankDecoder)


amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesItemDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes
amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesItemDecoder =
    Json.Decode.oneOf
        [ Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes0 <| amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObjectDecoder
        , Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes1 <| amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMemberDecoder
        ]


amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject
amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObjectDecoder =
    Json.Decode.map5 AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject
        (Json.Decode.field "ContextFreeName" Json.Decode.string)
        (Json.Decode.field "DisplayName" Json.Decode.string)
        (Json.Decode.field "Id" Json.Decode.string)
        (Json.Decode.field "IsRoot" Json.Decode.bool)
        (Json.Decode.field "SalesRank" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMemberDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember
amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMemberDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember
        (Json.Decode.field "ContextFreeName" Json.Decode.string)
        (Json.Decode.field "DisplayName" Json.Decode.string)
        (Json.Decode.field "Id" Json.Decode.string)
        (Json.Decode.field "IsRoot" Json.Decode.bool)


amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRankDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank
amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRankDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank
        (Json.Decode.field "SalesRank" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsObjectImagesDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectImages
amazonPAAPIResponseItemsResultItemsObjectImagesDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectImages
        (Json.Decode.field "Primary" amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryDecoder)


amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectImagesPrimary
amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectImagesPrimary
        (Json.Decode.field "Large" amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLargeDecoder)


amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLargeDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge
amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLargeDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge
        (Json.Decode.field "Height" Json.Decode.int)
        (Json.Decode.field "URL" Json.Decode.string)
        (Json.Decode.field "Width" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsObjectItemInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfo
amazonPAAPIResponseItemsResultItemsObjectItemInfoDecoder =
    Json.Decode.map5 AmazonPAAPIResponseItemsResultItemsObjectItemInfo
        (Json.Decode.field "ByLineInfo" amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoDecoder)
        (Json.Decode.field "ContentInfo" amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoDecoder)
        (Json.Decode.field "ProductInfo" amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoDecoder)
        (Json.Decode.field "TechnicalInfo" amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoDecoder)
        (Json.Decode.field "Title" amazonPAAPIResponseItemsResultItemsObjectItemInfoTitleDecoder)


amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo
amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo
        (Json.Decode.field "Contributors" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObjectDecoder)


amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject
amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObjectDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject
        (Json.Decode.field "Locale" Json.Decode.string)
        (Json.Decode.field "Name" Json.Decode.string)
        (Json.Decode.field "Role" Json.Decode.string)
        (Json.Decode.field "RoleType" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo
amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo
        (Json.Decode.field "Edition" amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEditionDecoder)
        (Json.Decode.field "Languages" amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDecoder)
        (Json.Decode.field "PagesCount" amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCountDecoder)
        (Json.Decode.field "PublicationDate" amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDateDecoder)


amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEditionDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition
amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEditionDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages
amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages
        (Json.Decode.field "DisplayValues" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObjectDecoder)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject
amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObjectDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Type" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCountDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount
amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCountDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount
        (Json.Decode.field "DisplayValue" Json.Decode.int)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDateDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate
amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDateDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo
amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo
        (Json.Decode.field "IsAdultProduct" amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProductDecoder)
        (Json.Decode.field "ReleaseDate" amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDateDecoder)


amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProductDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct
amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProductDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct
        (Json.Decode.field "DisplayValue" Json.Decode.bool)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDateDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate
amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDateDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo
amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo
        (Json.Decode.field "Formats" amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormatsDecoder)


amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormatsDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats
amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormatsDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats
        (Json.Decode.field "DisplayValues" <| Json.Decode.list Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectItemInfoTitleDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle
amazonPAAPIResponseItemsResultItemsObjectItemInfoTitleDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectOffersDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffers
amazonPAAPIResponseItemsResultItemsObjectOffersDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsObjectOffers
        (Json.Decode.field "Listings" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDecoder)
        (Json.Decode.field "Summaries" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectDecoder)


amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject
amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDecoder =
    Json.Decode.map5 AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject
        (Json.Decode.field "Availability" amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailabilityDecoder)
        (Json.Decode.field "DeliveryInfo" amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfoDecoder)
        (Json.Decode.field "Id" Json.Decode.string)
        (Json.Decode.field "Price" amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPriceDecoder)
        (Json.Decode.field "ViolatesMAP" Json.Decode.bool)


amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailabilityDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability
amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailabilityDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability
        (Json.Decode.field "Message" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo
amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfoDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo
        (Json.Decode.field "IsAmazonFulfilled" Json.Decode.bool)
        (Json.Decode.field "IsFreeShippingEligible" Json.Decode.bool)
        (Json.Decode.field "IsPrimeEligible" Json.Decode.bool)


amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPriceDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice
amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPriceDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice
        (Json.Decode.field "Amount" Json.Decode.int)
        (Json.Decode.field "Currency" Json.Decode.string)
        (Json.Decode.field "DisplayAmount" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject
amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject
        (Json.Decode.field "Condition" amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectConditionDecoder)
        (Json.Decode.field "HighestPrice" amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPriceDecoder)
        (Json.Decode.field "LowestPrice" amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPriceDecoder)
        (Json.Decode.field "OfferCount" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectConditionDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition
amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectConditionDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition
        (Json.Decode.field "Value" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPriceDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice
amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPriceDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice
        (Json.Decode.field "Amount" Json.Decode.int)
        (Json.Decode.field "Currency" Json.Decode.string)
        (Json.Decode.field "DisplayAmount" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPriceDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice
amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPriceDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice
        (Json.Decode.field "Amount" Json.Decode.int)
        (Json.Decode.field "Currency" Json.Decode.string)
        (Json.Decode.field "DisplayAmount" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMember
amazonPAAPIResponseItemsResultItemsMemberDecoder =
    Json.Decode.map6 AmazonPAAPIResponseItemsResultItemsMember
        (Json.Decode.field "ASIN" Json.Decode.string)
        (Json.Decode.field "BrowseNodeInfo" amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoDecoder)
        (Json.Decode.field "DetailPageURL" Json.Decode.string)
        (Json.Decode.field "Images" amazonPAAPIResponseItemsResultItemsMemberImagesDecoder)
        (Json.Decode.field "ItemInfo" amazonPAAPIResponseItemsResultItemsMemberItemInfoDecoder)
        (Json.Decode.field "Offers" amazonPAAPIResponseItemsResultItemsMemberOffersDecoder)


amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo
amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo
        (Json.Decode.field "BrowseNodes" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesItemDecoder)
        (Json.Decode.field "WebsiteSalesRank" amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRankDecoder)


amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesItemDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes
amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesItemDecoder =
    Json.Decode.oneOf
        [ Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes0 <| amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObjectDecoder
        , Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes1 <| amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMemberDecoder
        ]


amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject
amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObjectDecoder =
    Json.Decode.map5 AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject
        (Json.Decode.field "ContextFreeName" Json.Decode.string)
        (Json.Decode.field "DisplayName" Json.Decode.string)
        (Json.Decode.field "Id" Json.Decode.string)
        (Json.Decode.field "IsRoot" Json.Decode.bool)
        (Json.Decode.field "SalesRank" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMemberDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember
amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMemberDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember
        (Json.Decode.field "ContextFreeName" Json.Decode.string)
        (Json.Decode.field "DisplayName" Json.Decode.string)
        (Json.Decode.field "Id" Json.Decode.string)
        (Json.Decode.field "IsRoot" Json.Decode.bool)


amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRankDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank
amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRankDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank
        (Json.Decode.field "SalesRank" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsMemberImagesDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberImages
amazonPAAPIResponseItemsResultItemsMemberImagesDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberImages
        (Json.Decode.field "Primary" amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryDecoder)


amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberImagesPrimary
amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberImagesPrimary
        (Json.Decode.field "Large" amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLargeDecoder)


amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLargeDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge
amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLargeDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge
        (Json.Decode.field "Height" Json.Decode.int)
        (Json.Decode.field "URL" Json.Decode.string)
        (Json.Decode.field "Width" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsMemberItemInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfo
amazonPAAPIResponseItemsResultItemsMemberItemInfoDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberItemInfo
        (Json.Decode.field "ByLineInfo" amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoDecoder)
        (Json.Decode.field "ContentInfo" amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoDecoder)
        (Json.Decode.field "ProductInfo" amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoDecoder)
        (Json.Decode.field "Title" amazonPAAPIResponseItemsResultItemsMemberItemInfoTitleDecoder)


amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo
amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo
        (Json.Decode.field "Contributors" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObjectDecoder)
        (Json.Decode.field "Manufacturer" amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturerDecoder)


amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject
amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObjectDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject
        (Json.Decode.field "Locale" Json.Decode.string)
        (Json.Decode.field "Name" Json.Decode.string)
        (Json.Decode.field "Role" Json.Decode.string)
        (Json.Decode.field "RoleType" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturerDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer
amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturerDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo
amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo
        (Json.Decode.field "Languages" amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDecoder)
        (Json.Decode.field "PagesCount" amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCountDecoder)
        (Json.Decode.field "PublicationDate" amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDateDecoder)


amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages
amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages
        (Json.Decode.field "DisplayValues" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObjectDecoder)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject
amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObjectDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Type" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCountDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount
amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCountDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount
        (Json.Decode.field "DisplayValue" Json.Decode.int)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDateDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate
amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDateDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo
amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo
        (Json.Decode.field "IsAdultProduct" amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProductDecoder)
        (Json.Decode.field "ItemDimensions" amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsDecoder)


amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProductDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct
amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProductDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct
        (Json.Decode.field "DisplayValue" Json.Decode.bool)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions
amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions
        (Json.Decode.field "Height" amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeightDecoder)
        (Json.Decode.field "Length" amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLengthDecoder)
        (Json.Decode.field "Width" amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidthDecoder)


amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeightDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight
amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeightDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight
        (Json.Decode.field "DisplayValue" Json.Decode.int)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)
        (Json.Decode.field "Unit" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLengthDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength
amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLengthDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength
        (Json.Decode.field "DisplayValue" Json.Decode.int)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)
        (Json.Decode.field "Unit" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidthDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth
amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidthDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth
        (Json.Decode.field "DisplayValue" Json.Decode.float)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)
        (Json.Decode.field "Unit" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberItemInfoTitleDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle
amazonPAAPIResponseItemsResultItemsMemberItemInfoTitleDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle
        (Json.Decode.field "DisplayValue" Json.Decode.string)
        (Json.Decode.field "Label" Json.Decode.string)
        (Json.Decode.field "Locale" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberOffersDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffers
amazonPAAPIResponseItemsResultItemsMemberOffersDecoder =
    Json.Decode.map2 AmazonPAAPIResponseItemsResultItemsMemberOffers
        (Json.Decode.field "Listings" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDecoder)
        (Json.Decode.field "Summaries" <| Json.Decode.list amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectDecoder)


amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject
amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDecoder =
    Json.Decode.map5 AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject
        (Json.Decode.field "Availability" amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailabilityDecoder)
        (Json.Decode.field "DeliveryInfo" amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfoDecoder)
        (Json.Decode.field "Id" Json.Decode.string)
        (Json.Decode.field "Price" amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPriceDecoder)
        (Json.Decode.field "ViolatesMAP" Json.Decode.bool)


amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailabilityDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability
amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailabilityDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability
        (Json.Decode.field "Message" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfoDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo
amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfoDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo
        (Json.Decode.field "IsAmazonFulfilled" Json.Decode.bool)
        (Json.Decode.field "IsFreeShippingEligible" Json.Decode.bool)
        (Json.Decode.field "IsPrimeEligible" Json.Decode.bool)


amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPriceDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice
amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPriceDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice
        (Json.Decode.field "Amount" Json.Decode.int)
        (Json.Decode.field "Currency" Json.Decode.string)
        (Json.Decode.field "DisplayAmount" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject
amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectDecoder =
    Json.Decode.map4 AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject
        (Json.Decode.field "Condition" amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectConditionDecoder)
        (Json.Decode.field "HighestPrice" amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPriceDecoder)
        (Json.Decode.field "LowestPrice" amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPriceDecoder)
        (Json.Decode.field "OfferCount" Json.Decode.int)


amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectConditionDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition
amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectConditionDecoder =
    Json.Decode.map AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition
        (Json.Decode.field "Value" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPriceDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice
amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPriceDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice
        (Json.Decode.field "Amount" Json.Decode.int)
        (Json.Decode.field "Currency" Json.Decode.string)
        (Json.Decode.field "DisplayAmount" Json.Decode.string)


amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPriceDecoder : Json.Decode.Decoder AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice
amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPriceDecoder =
    Json.Decode.map3 AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice
        (Json.Decode.field "Amount" Json.Decode.int)
        (Json.Decode.field "Currency" Json.Decode.string)
        (Json.Decode.field "DisplayAmount" Json.Decode.string)


encodedAmazonPAAPIResponse : AmazonPAAPIResponse -> Json.Encode.Value
encodedAmazonPAAPIResponse amazonPAAPIResponse =
    Json.Encode.object
        [ ( "ItemsResult", encodedAmazonPAAPIResponseItemsResult amazonPAAPIResponse.itemsResult )
        ]


encodedAmazonPAAPIResponseItemsResult : AmazonPAAPIResponseItemsResult -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResult amazonPAAPIResponseItemsResult =
    Json.Encode.object
        [ ( "Items", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsItem amazonPAAPIResponseItemsResult.items )
        ]


encodedAmazonPAAPIResponseItemsResultItemsItem : AmazonPAAPIResponseItemsResultItems -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsItem amazonPAAPIResponseItemsResultItems =
    case amazonPAAPIResponseItemsResultItems of
        AmazonPAAPIResponseItemsResultItems0 value ->
            encodedAmazonPAAPIResponseItemsResultItemsObject value

        AmazonPAAPIResponseItemsResultItems1 value ->
            encodedAmazonPAAPIResponseItemsResultItemsMember value


encodedAmazonPAAPIResponseItemsResultItemsObject : AmazonPAAPIResponseItemsResultItemsObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObject amazonPAAPIResponseItemsResultItemsObject =
    Json.Encode.object
        [ ( "ASIN", Json.Encode.string amazonPAAPIResponseItemsResultItemsObject.aSIN )
        , ( "BrowseNodeInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo amazonPAAPIResponseItemsResultItemsObject.browseNodeInfo )
        , ( "DetailPageURL", Json.Encode.string amazonPAAPIResponseItemsResultItemsObject.detailPageURL )
        , ( "Images", encodedAmazonPAAPIResponseItemsResultItemsObjectImages amazonPAAPIResponseItemsResultItemsObject.images )
        , ( "ItemInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfo amazonPAAPIResponseItemsResultItemsObject.itemInfo )
        , ( "Offers", encodedAmazonPAAPIResponseItemsResultItemsObjectOffers amazonPAAPIResponseItemsResultItemsObject.offers )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo =
    Json.Encode.object
        [ ( "BrowseNodes", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesItem amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo.browseNodes )
        , ( "WebsiteSalesRank", encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfo.websiteSalesRank )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesItem : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesItem amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes =
    case amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes of
        AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes0 value ->
            encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject value

        AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodes1 value ->
            encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember value


encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject =
    Json.Encode.object
        [ ( "ContextFreeName", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject.contextFreeName )
        , ( "DisplayName", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject.displayName )
        , ( "Id", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject.id )
        , ( "IsRoot", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject.isRoot )
        , ( "SalesRank", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesObject.salesRank )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember =
    Json.Encode.object
        [ ( "ContextFreeName", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember.contextFreeName )
        , ( "DisplayName", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember.displayName )
        , ( "Id", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember.id )
        , ( "IsRoot", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoBrowseNodesMember.isRoot )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank : AmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank =
    Json.Encode.object
        [ ( "SalesRank", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectBrowseNodeInfoWebsiteSalesRank.salesRank )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectImages : AmazonPAAPIResponseItemsResultItemsObjectImages -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectImages amazonPAAPIResponseItemsResultItemsObjectImages =
    Json.Encode.object
        [ ( "Primary", encodedAmazonPAAPIResponseItemsResultItemsObjectImagesPrimary amazonPAAPIResponseItemsResultItemsObjectImages.primary )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectImagesPrimary : AmazonPAAPIResponseItemsResultItemsObjectImagesPrimary -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectImagesPrimary amazonPAAPIResponseItemsResultItemsObjectImagesPrimary =
    Json.Encode.object
        [ ( "Large", encodedAmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge amazonPAAPIResponseItemsResultItemsObjectImagesPrimary.large )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge : AmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge =
    Json.Encode.object
        [ ( "Height", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge.height )
        , ( "URL", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge.url )
        , ( "Width", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectImagesPrimaryLarge.width )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfo amazonPAAPIResponseItemsResultItemsObjectItemInfo =
    Json.Encode.object
        [ ( "ByLineInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo amazonPAAPIResponseItemsResultItemsObjectItemInfo.byLineInfo )
        , ( "ContentInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo amazonPAAPIResponseItemsResultItemsObjectItemInfo.contentInfo )
        , ( "ProductInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo amazonPAAPIResponseItemsResultItemsObjectItemInfo.productInfo )
        , ( "TechnicalInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo amazonPAAPIResponseItemsResultItemsObjectItemInfo.technicalInfo )
        , ( "Title", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle amazonPAAPIResponseItemsResultItemsObjectItemInfo.title )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo =
    Json.Encode.object
        [ ( "Contributors", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfo.contributors )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject : AmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject =
    Json.Encode.object
        [ ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject.locale )
        , ( "Name", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject.name )
        , ( "Role", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject.role )
        , ( "RoleType", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoByLineInfoContributorsObject.roleType )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo =
    Json.Encode.object
        [ ( "Edition", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo.edition )
        , ( "Languages", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo.languages )
        , ( "PagesCount", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo.pagesCount )
        , ( "PublicationDate", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfo.publicationDate )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoEdition.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages =
    Json.Encode.object
        [ ( "DisplayValues", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages.displayValues )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguages.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject.displayValue )
        , ( "Type", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoLanguagesDisplayValuesObject.type_ )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPagesCount.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate : AmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoContentInfoPublicationDate.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo =
    Json.Encode.object
        [ ( "IsAdultProduct", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo.isAdultProduct )
        , ( "ReleaseDate", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfo.releaseDate )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct : AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoIsAdultProduct.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate : AmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoProductInfoReleaseDate.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo : AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo =
    Json.Encode.object
        [ ( "Formats", encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfo.formats )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats : AmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats =
    Json.Encode.object
        [ ( "DisplayValues", Json.Encode.list Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats.displayValues )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoTechnicalInfoFormats.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle : AmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectItemInfoTitle amazonPAAPIResponseItemsResultItemsObjectItemInfoTitle =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoTitle.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoTitle.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectItemInfoTitle.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffers : AmazonPAAPIResponseItemsResultItemsObjectOffers -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffers amazonPAAPIResponseItemsResultItemsObjectOffers =
    Json.Encode.object
        [ ( "Listings", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject amazonPAAPIResponseItemsResultItemsObjectOffers.listings )
        , ( "Summaries", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject amazonPAAPIResponseItemsResultItemsObjectOffers.summaries )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObject amazonPAAPIResponseItemsResultItemsObjectOffersListingsObject =
    Json.Encode.object
        [ ( "Availability", encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability amazonPAAPIResponseItemsResultItemsObjectOffersListingsObject.availability )
        , ( "DeliveryInfo", encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo amazonPAAPIResponseItemsResultItemsObjectOffersListingsObject.deliveryInfo )
        , ( "Id", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersListingsObject.id )
        , ( "Price", encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice amazonPAAPIResponseItemsResultItemsObjectOffersListingsObject.price )
        , ( "ViolatesMAP", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectOffersListingsObject.violatesMAP )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability =
    Json.Encode.object
        [ ( "Message", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectAvailability.message )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo =
    Json.Encode.object
        [ ( "IsAmazonFulfilled", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo.isAmazonFulfilled )
        , ( "IsFreeShippingEligible", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo.isFreeShippingEligible )
        , ( "IsPrimeEligible", Json.Encode.bool amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectDeliveryInfo.isPrimeEligible )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice : AmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice =
    Json.Encode.object
        [ ( "Amount", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice.amount )
        , ( "Currency", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice.currency )
        , ( "DisplayAmount", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersListingsObjectPrice.displayAmount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject =
    Json.Encode.object
        [ ( "Condition", encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject.condition )
        , ( "HighestPrice", encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject.highestPrice )
        , ( "LowestPrice", encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject.lowestPrice )
        , ( "OfferCount", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObject.offerCount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition =
    Json.Encode.object
        [ ( "Value", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectCondition.value )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice =
    Json.Encode.object
        [ ( "Amount", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice.amount )
        , ( "Currency", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice.currency )
        , ( "DisplayAmount", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectHighestPrice.displayAmount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice : AmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice =
    Json.Encode.object
        [ ( "Amount", Json.Encode.int amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice.amount )
        , ( "Currency", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice.currency )
        , ( "DisplayAmount", Json.Encode.string amazonPAAPIResponseItemsResultItemsObjectOffersSummariesObjectLowestPrice.displayAmount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMember : AmazonPAAPIResponseItemsResultItemsMember -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMember amazonPAAPIResponseItemsResultItemsMember =
    Json.Encode.object
        [ ( "ASIN", Json.Encode.string amazonPAAPIResponseItemsResultItemsMember.aSIN )
        , ( "BrowseNodeInfo", encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo amazonPAAPIResponseItemsResultItemsMember.browseNodeInfo )
        , ( "DetailPageURL", Json.Encode.string amazonPAAPIResponseItemsResultItemsMember.detailPageURL )
        , ( "Images", encodedAmazonPAAPIResponseItemsResultItemsMemberImages amazonPAAPIResponseItemsResultItemsMember.images )
        , ( "ItemInfo", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfo amazonPAAPIResponseItemsResultItemsMember.itemInfo )
        , ( "Offers", encodedAmazonPAAPIResponseItemsResultItemsMemberOffers amazonPAAPIResponseItemsResultItemsMember.offers )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo =
    Json.Encode.object
        [ ( "BrowseNodes", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesItem amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo.browseNodes )
        , ( "WebsiteSalesRank", encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfo.websiteSalesRank )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesItem : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesItem amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes =
    case amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes of
        AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes0 value ->
            encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject value

        AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodes1 value ->
            encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember value


encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject =
    Json.Encode.object
        [ ( "ContextFreeName", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject.contextFreeName )
        , ( "DisplayName", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject.displayName )
        , ( "Id", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject.id )
        , ( "IsRoot", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject.isRoot )
        , ( "SalesRank", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesObject.salesRank )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember =
    Json.Encode.object
        [ ( "ContextFreeName", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember.contextFreeName )
        , ( "DisplayName", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember.displayName )
        , ( "Id", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember.id )
        , ( "IsRoot", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoBrowseNodesMember.isRoot )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank : AmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank =
    Json.Encode.object
        [ ( "SalesRank", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberBrowseNodeInfoWebsiteSalesRank.salesRank )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberImages : AmazonPAAPIResponseItemsResultItemsMemberImages -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberImages amazonPAAPIResponseItemsResultItemsMemberImages =
    Json.Encode.object
        [ ( "Primary", encodedAmazonPAAPIResponseItemsResultItemsMemberImagesPrimary amazonPAAPIResponseItemsResultItemsMemberImages.primary )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberImagesPrimary : AmazonPAAPIResponseItemsResultItemsMemberImagesPrimary -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberImagesPrimary amazonPAAPIResponseItemsResultItemsMemberImagesPrimary =
    Json.Encode.object
        [ ( "Large", encodedAmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge amazonPAAPIResponseItemsResultItemsMemberImagesPrimary.large )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge : AmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge =
    Json.Encode.object
        [ ( "Height", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge.height )
        , ( "URL", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge.url )
        , ( "Width", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberImagesPrimaryLarge.width )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfo amazonPAAPIResponseItemsResultItemsMemberItemInfo =
    Json.Encode.object
        [ ( "ByLineInfo", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo amazonPAAPIResponseItemsResultItemsMemberItemInfo.byLineInfo )
        , ( "ContentInfo", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo amazonPAAPIResponseItemsResultItemsMemberItemInfo.contentInfo )
        , ( "ProductInfo", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo amazonPAAPIResponseItemsResultItemsMemberItemInfo.productInfo )
        , ( "Title", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle amazonPAAPIResponseItemsResultItemsMemberItemInfo.title )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo =
    Json.Encode.object
        [ ( "Contributors", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo.contributors )
        , ( "Manufacturer", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfo.manufacturer )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject : AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject =
    Json.Encode.object
        [ ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject.locale )
        , ( "Name", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject.name )
        , ( "Role", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject.role )
        , ( "RoleType", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoContributorsObject.roleType )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer : AmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoByLineInfoManufacturer.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo =
    Json.Encode.object
        [ ( "Languages", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo.languages )
        , ( "PagesCount", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo.pagesCount )
        , ( "PublicationDate", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfo.publicationDate )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages =
    Json.Encode.object
        [ ( "DisplayValues", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages.displayValues )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguages.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject.displayValue )
        , ( "Type", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoLanguagesDisplayValuesObject.type_ )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPagesCount.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate : AmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoContentInfoPublicationDate.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo =
    Json.Encode.object
        [ ( "IsAdultProduct", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo.isAdultProduct )
        , ( "ItemDimensions", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfo.itemDimensions )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoIsAdultProduct.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions =
    Json.Encode.object
        [ ( "Height", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions.height )
        , ( "Length", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions.length )
        , ( "Width", encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensions.width )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight.locale )
        , ( "Unit", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsHeight.unit )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength.locale )
        , ( "Unit", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsLength.unit )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth : AmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.float amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth.locale )
        , ( "Unit", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoProductInfoItemDimensionsWidth.unit )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle : AmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberItemInfoTitle amazonPAAPIResponseItemsResultItemsMemberItemInfoTitle =
    Json.Encode.object
        [ ( "DisplayValue", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoTitle.displayValue )
        , ( "Label", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoTitle.label )
        , ( "Locale", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberItemInfoTitle.locale )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffers : AmazonPAAPIResponseItemsResultItemsMemberOffers -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffers amazonPAAPIResponseItemsResultItemsMemberOffers =
    Json.Encode.object
        [ ( "Listings", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject amazonPAAPIResponseItemsResultItemsMemberOffers.listings )
        , ( "Summaries", Json.Encode.list encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject amazonPAAPIResponseItemsResultItemsMemberOffers.summaries )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObject amazonPAAPIResponseItemsResultItemsMemberOffersListingsObject =
    Json.Encode.object
        [ ( "Availability", encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability amazonPAAPIResponseItemsResultItemsMemberOffersListingsObject.availability )
        , ( "DeliveryInfo", encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo amazonPAAPIResponseItemsResultItemsMemberOffersListingsObject.deliveryInfo )
        , ( "Id", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersListingsObject.id )
        , ( "Price", encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice amazonPAAPIResponseItemsResultItemsMemberOffersListingsObject.price )
        , ( "ViolatesMAP", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberOffersListingsObject.violatesMAP )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability =
    Json.Encode.object
        [ ( "Message", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectAvailability.message )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo =
    Json.Encode.object
        [ ( "IsAmazonFulfilled", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo.isAmazonFulfilled )
        , ( "IsFreeShippingEligible", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo.isFreeShippingEligible )
        , ( "IsPrimeEligible", Json.Encode.bool amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectDeliveryInfo.isPrimeEligible )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice : AmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice =
    Json.Encode.object
        [ ( "Amount", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice.amount )
        , ( "Currency", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice.currency )
        , ( "DisplayAmount", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersListingsObjectPrice.displayAmount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject =
    Json.Encode.object
        [ ( "Condition", encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject.condition )
        , ( "HighestPrice", encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject.highestPrice )
        , ( "LowestPrice", encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject.lowestPrice )
        , ( "OfferCount", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObject.offerCount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition =
    Json.Encode.object
        [ ( "Value", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectCondition.value )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice =
    Json.Encode.object
        [ ( "Amount", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice.amount )
        , ( "Currency", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice.currency )
        , ( "DisplayAmount", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectHighestPrice.displayAmount )
        ]


encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice : AmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice -> Json.Encode.Value
encodedAmazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice =
    Json.Encode.object
        [ ( "Amount", Json.Encode.int amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice.amount )
        , ( "Currency", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice.currency )
        , ( "DisplayAmount", Json.Encode.string amazonPAAPIResponseItemsResultItemsMemberOffersSummariesObjectLowestPrice.displayAmount )
        ]
