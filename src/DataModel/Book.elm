module DataModel.Book exposing (..)

import Form exposing (Form)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import SyntaxHighlight exposing (Highlight(..))


type alias Response =
    { itemsResult : ItemsResult
    }


type alias ItemsResult =
    { items : List Item
    }


type alias Item =
    { asin : String
    , browseNodeInfo : BrowseNodeInfo
    , detailPageURL : String
    , images : Images
    , itemInfo : ItemInfo
    , offers : Offers
    }


type alias BrowseNodeInfo =
    { browseNodes : List BrowseNode
    , websiteSalesRank : WebsiteSalesRank
    }


type alias BrowseNode =
    { contextFreeName : String
    , displayName : String
    , id : String
    , isRoot : Bool
    , salesRank : Maybe Int
    }


type alias WebsiteSalesRank =
    { salesRank : Int
    }


type alias Images =
    { primary : ImagesContainer
    , variants : Maybe ImagesContainer
    }


type alias ImagesContainer =
    { large : Image
    , medium : Image
    , small : Image
    }


type alias Image =
    { height : Int
    , url : String
    , width : Int
    }


type alias ItemInfo =
    { byLineInfo : ByLineInfo
    , contentInfo : ContentInfo
    , productInfo : ProductInfo
    , technicalInfo : Maybe TechnicalInfo
    , title : Title
    }


type alias ByLineInfo =
    { contributors : List Contributor
    , manufacturer : Maybe Title
    }


type alias Contributor =
    { locale : String
    , name : String
    , role : String
    , roleType : String
    }


type alias Title =
    { displayValue : String
    , label : String
    , locale : String
    }


type alias ContentInfo =
    { edition : Maybe Title
    , languages : Languages
    , pagesCount : Countable
    , publicationDate : Title
    }


type alias Languages =
    { displayValues : List DisplayValue
    , label : String
    , locale : String
    }


type alias DisplayValue =
    { displayValue : String
    , displayValueType : String
    }


type alias Countable =
    { displayValue : Float
    , label : String
    , locale : String
    , unit : Maybe String
    }


type alias ProductInfo =
    { isAdultProduct : IsBoolean
    , releaseDate : Maybe Title
    , itemDimensions : Maybe ItemDimensions
    }


type alias IsBoolean =
    { displayValue : Bool
    , label : String
    , locale : String
    }


type alias ItemDimensions =
    { height : Countable
    , length : Countable
    , width : Countable
    }


type alias TechnicalInfo =
    { formats : ListTitle
    }


type alias ListTitle =
    { displayValues : List String
    , label : String
    , locale : String
    }


type alias Offers =
    { listings : List Listing
    , summaries : List Summary
    }


type alias Listing =
    { availability : Availability
    , deliveryInfo : DeliveryInfo
    , id : String
    , price : Price
    , violatesMAP : Bool
    }


type alias Availability =
    { message : String
    }


type alias DeliveryInfo =
    { isAmazonFulfilled : Bool
    , isFreeShippingEligible : Bool
    , isPrimeEligible : Bool
    }


type alias Price =
    { amount : Float
    , currency : String
    , displayAmount : String
    }


type alias Summary =
    { condition : Condition
    , highestPrice : Price
    , lowestPrice : Price
    , offerCount : Int
    }


type alias Condition =
    { value : String
    }


responseDecoder : Decoder Response
responseDecoder =
    Decode.map Response (Decode.field "ItemsResult" itemsResultDecoder)


itemsResultDecoder : Decoder ItemsResult
itemsResultDecoder =
    Decode.map ItemsResult (Decode.field "Items" (Decode.list itemDecoder))


itemDecoder : Decoder Item
itemDecoder =
    Decode.map6 Item
        (Decode.field "ASIN" Decode.string)
        (Decode.field "BrowseNodeInfo" browseNodeInfoDecoder)
        (Decode.field "DetailPageURL" Decode.string)
        (Decode.field "Images" imagesDecoder)
        (Decode.field "ItemInfo" itemInfoDecoder)
        (Decode.field "Offers" offersDecoder)


offersDecoder : Decoder Offers
offersDecoder =
    Decode.map2 Offers
        (Decode.field "Listings" (Decode.list listingDecoder))
        (Decode.field "Summaries" (Decode.list summaryDecoder))


listingDecoder : Decoder Listing
listingDecoder =
    Decode.map5 Listing
        (Decode.field "Availability" availabilityDecoder)
        (Decode.field "DeliveryInfo" deliveryInfoDecoder)
        (Decode.field "Id" Decode.string)
        (Decode.field "Price" priceDecoder)
        (Decode.field "ViolatesMAP" Decode.bool)


availabilityDecoder : Decoder Availability
availabilityDecoder =
    Decode.map Availability (Decode.field "Message" Decode.string)


summaryDecoder : Decoder Summary
summaryDecoder =
    Decode.map4 Summary
        (Decode.field "Condition" conditionDecoder)
        (Decode.field "HighestPrice" priceDecoder)
        (Decode.field "LowestPrice" priceDecoder)
        (Decode.field "OfferCount" Decode.int)


conditionDecoder : Decoder Condition
conditionDecoder =
    Decode.map Condition (Decode.field "Value" Decode.string)


deliveryInfoDecoder : Decoder DeliveryInfo
deliveryInfoDecoder =
    Decode.map3 DeliveryInfo
        (Decode.field "IsAmazonFulfilled" Decode.bool)
        (Decode.field "IsFreeShippingEligible" Decode.bool)
        (Decode.field "IsPrimeEligible" Decode.bool)


priceDecoder : Decoder Price
priceDecoder =
    Decode.map3 Price
        (Decode.field "Amount" Decode.float)
        (Decode.field "Currency" Decode.string)
        (Decode.field "DisplayAmount" Decode.string)


browseNodeInfoDecoder : Decoder BrowseNodeInfo
browseNodeInfoDecoder =
    Decode.map2 BrowseNodeInfo
        (Decode.field "BrowseNodes" (Decode.list browseNodeDecoder))
        (Decode.field "WebsiteSalesRank" websiteSalesRankDecoder)


websiteSalesRankDecoder : Decoder WebsiteSalesRank
websiteSalesRankDecoder =
    Decode.map WebsiteSalesRank (Decode.field "SalesRank" Decode.int)


browseNodeDecoder : Decoder BrowseNode
browseNodeDecoder =
    Decode.map5 BrowseNode
        (Decode.field "ContextFreeName" Decode.string)
        (Decode.field "DisplayName" Decode.string)
        (Decode.field "Id" Decode.string)
        (Decode.field "IsRoot" Decode.bool)
        (Decode.maybe (Decode.field "SalesRank" Decode.int))


imagesDecoder : Decoder Images
imagesDecoder =
    Decode.map2 Images
        (Decode.field "Primary" imagesContainerDecoder)
        (Decode.maybe (Decode.field "Variants" imagesContainerDecoder))


imagesContainerDecoder : Decoder ImagesContainer
imagesContainerDecoder =
    Decode.map3 ImagesContainer
        (Decode.field "Large" imageDecoder)
        (Decode.field "Medium" imageDecoder)
        (Decode.field "Small" imageDecoder)


imageDecoder : Decoder Image
imageDecoder =
    Decode.map3 Image
        (Decode.field "Height" Decode.int)
        (Decode.field "URL" Decode.string)
        (Decode.field "Width" Decode.int)


itemInfoDecoder : Decoder ItemInfo
itemInfoDecoder =
    Decode.map5 ItemInfo
        (Decode.field "ByLineInfo" byLineInfoDecoder)
        (Decode.field "ContentInfo" contentInfoDecoder)
        (Decode.field "ProductInfo" productInfoDecoder)
        (Decode.maybe (Decode.field "TechnicalInfo" technicalInfoDecoder))
        (Decode.field "Title" titleDecoder)


technicalInfoDecoder : Decoder TechnicalInfo
technicalInfoDecoder =
    Decode.map TechnicalInfo (Decode.field "Formats" listTitleDecoder)


listTitleDecoder : Decoder ListTitle
listTitleDecoder =
    Decode.map3 ListTitle
        (Decode.field "DisplayValue" (Decode.list Decode.string))
        (Decode.field "Label" Decode.string)
        (Decode.field "Locale" Decode.string)


productInfoDecoder : Decoder ProductInfo
productInfoDecoder =
    Decode.map3 ProductInfo
        (Decode.field "IsAdultProduct" isBooleanDecoder)
        (Decode.maybe (Decode.field "ReleaseDate" titleDecoder))
        (Decode.maybe (Decode.field "ItemDimensions" itemDimensionsDecoder))


itemDimensionsDecoder : Decoder ItemDimensions
itemDimensionsDecoder =
    Decode.map3 ItemDimensions
        (Decode.field "Height" countableDecoder)
        (Decode.field "Length" countableDecoder)
        (Decode.field "Width" countableDecoder)


isBooleanDecoder : Decoder IsBoolean
isBooleanDecoder =
    Decode.map3 IsBoolean
        (Decode.field "DisplayValue" Decode.bool)
        (Decode.field "Label" Decode.string)
        (Decode.field "Locale" Decode.string)


contentInfoDecoder : Decoder ContentInfo
contentInfoDecoder =
    Decode.map4 ContentInfo
        (Decode.maybe (Decode.field "Edition" titleDecoder))
        (Decode.field "Languages" languagesDecoder)
        (Decode.field "PagesCount" countableDecoder)
        (Decode.field "PublicationDate" titleDecoder)


languagesDecoder : Decoder Languages
languagesDecoder =
    Decode.map3 Languages
        (Decode.field "DisplayValues" (Decode.list displayValueDecoder))
        (Decode.field "Label" Decode.string)
        (Decode.field "Locale" Decode.string)


countableDecoder : Decoder Countable
countableDecoder =
    Decode.map4 Countable
        (Decode.field "DisplayValue" Decode.float)
        (Decode.field "Label" Decode.string)
        (Decode.field "Locale" Decode.string)
        (Decode.maybe (Decode.field "Unit" Decode.string))


displayValueDecoder : Decoder DisplayValue
displayValueDecoder =
    Decode.map2 DisplayValue
        (Decode.field "DisplayValue" Decode.string)
        (Decode.field "Type" Decode.string)


byLineInfoDecoder : Decoder ByLineInfo
byLineInfoDecoder =
    Decode.map2 ByLineInfo
        (Decode.field "Contributors" (Decode.list contributorDecoder))
        (Decode.maybe (Decode.field "Manufacturer" titleDecoder))


contributorDecoder : Decoder Contributor
contributorDecoder =
    Decode.map4 Contributor
        (Decode.field "Locale" Decode.string)
        (Decode.field "Name" Decode.string)
        (Decode.field "Role" Decode.string)
        (Decode.field "RoleType" Decode.string)


titleDecoder : Decoder Title
titleDecoder =
    Decode.map3 Title
        (Decode.field "DisplayValue" Decode.string)
        (Decode.field "Label" Decode.string)
        (Decode.field "Locale" Decode.string)
