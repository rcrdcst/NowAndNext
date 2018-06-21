//
//  Channels.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation

struct Channels: Codable {
    let odataMetadata, odataCount: String
    let value: [ChannelsValue]
    let odataNextLink: String
    
    enum CodingKeys: String, CodingKey {
        case odataMetadata = "odata.metadata"
        case odataCount = "odata.count"
        case value
        case odataNextLink = "odata.nextLink"
    }
}

struct ChannelsValue: Codable {
    let id: Int
    let title: String
    let isAdult, inPromotion: Bool
    let promotionDescription: JSONNull?
    let productKey: String
    let parentalRating: JSONNull?
    let catalogPrice: String
    let availableOnChannels: AvailableOnChannels
    let thematic: Thematic
    let description: String
    let catalogOrderNumber: Int
    let deviceSubscription: Bool
    let presentationKey: String
    let isSpecialPromotion: Bool
    let commercialKey: CommercialKey
    let imageQuality: ImageQuality
    let exclusiveContent, restartTV, hasL2Vs, interactive: Bool
    let region: Region
    let callLetter: String
    let channelPosition: Int
    let language: Language
    let subtitled: Bool
    let minimumSubscriptionDays: Int
    let isLiveAnyTime: Bool
    let friendlyURLName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case isAdult = "IsAdult"
        case inPromotion = "InPromotion"
        case promotionDescription = "PromotionDescription"
        case productKey = "ProductKey"
        case parentalRating = "ParentalRating"
        case catalogPrice = "CatalogPrice"
        case availableOnChannels = "AvailableOnChannels"
        case thematic = "Thematic"
        case description = "Description"
        case catalogOrderNumber = "CatalogOrderNumber"
        case deviceSubscription = "DeviceSubscription"
        case presentationKey = "PresentationKey"
        case isSpecialPromotion = "IsSpecialPromotion"
        case commercialKey = "CommercialKey"
        case imageQuality = "ImageQuality"
        case exclusiveContent = "ExclusiveContent"
        case restartTV = "RestartTV"
        case hasL2Vs = "HasL2Vs"
        case interactive = "Interactive"
        case region = "Region"
        case callLetter = "CallLetter"
        case channelPosition = "ChannelPosition"
        case language = "Language"
        case subtitled = "Subtitled"
        case minimumSubscriptionDays = "MinimumSubscriptionDays"
        case isLiveAnyTime = "IsLiveAnyTime"
        case friendlyURLName = "FriendlyUrlName"
    }
}

enum AvailableOnChannels: String, Codable {
    case meoIPTVMEOPCMEOMobile = "MEO_IPTV,MEO_PC,MEO_Mobile"
    case meoIPTVMEOPCMEOMobileMEORFDigital = "MEO_IPTV,MEO_PC,MEO_Mobile,MEO_RFDigital"
}

enum CommercialKey: String, Codable {
    case empty = ""
}

enum ImageQuality: String, Codable {
    case hd = "HD"
    case sd = "SD"
}

enum Language: String, Codable {
    case português = "Português"
}

enum Region: String, Codable {
    case empty = ""
    case pt = "PT"
}

enum Thematic: String, Codable {
    case entretenimento = "Entretenimento"
    case generalistas = "Generalistas"
    case informação = "Informação"
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
