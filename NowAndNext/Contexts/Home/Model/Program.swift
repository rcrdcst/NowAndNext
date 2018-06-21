//
//  Program.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation

struct Program: Codable {
    let odataMetadata: String
    let value: [Value]
    
    enum CodingKeys: String, CodingKey {
        case odataMetadata = "odata.metadata"
        case value
    }
}

struct Value: Codable {
    let id, callLetter, startDate, startTime: String
    let programID: Int
    let endDate, title, synopsis: String
    let seriesID, seriesEpisodeNumber: Int?
    let participants: String?
    let imageURI: JSONNull?
    let isAdultContent, isEnabled: Bool
    let searchRank: Int
    let numberOfEpisodes: Int?
    let isLiveAnytimeChannel: Bool
    let titleID: String
    let isBlackout: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case callLetter = "CallLetter"
        case startDate = "StartDate"
        case startTime = "StartTime"
        case programID = "ProgramId"
        case endDate = "EndDate"
        case title = "Title"
        case synopsis = "Synopsis"
        case seriesID = "SeriesId"
        case seriesEpisodeNumber = "SeriesEpisodeNumber"
        case participants = "Participants"
        case imageURI = "ImageUri"
        case isAdultContent = "IsAdultContent"
        case isEnabled = "IsEnabled"
        case searchRank = "SearchRank"
        case numberOfEpisodes = "NumberOfEpisodes"
        case isLiveAnytimeChannel = "IsLiveAnytimeChannel"
        case titleID = "TitleId"
        case isBlackout = "IsBlackout"
    }
    
    func getCoverImg() -> String {
        return "http://proxycache.app.iptv.telecom.pt:8080/eemstb/ImageHandler.ashx?evTitle=\(title)&chCallLetter=\(callLetter)&profile=16_9&width"
    }
}



