//
//  MeoApi.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import Moya

enum MeoAPI {
    case channelsList()
    case channelNowAndNext(callLetter: String)
}

extension MeoAPI: TargetType  {
    
    var baseURL: URL {
        guard let url = URL(string: "http://ott.online.meo.pt/") else {
            fatalError("FAILED: http://ott.online.meo.pt/catalog/v6/Channels")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .channelsList:
            return "catalog/v6/Channels"
        case .channelNowAndNext:
            return "Program/v6/Programs/NowAndNextLiveChannelPrograms"
        }
    }

    var method: Moya.Method {
        switch self {
        case .channelsList:
            return .get
        case .channelNowAndNext:
            return .get
        }
        
    }
    
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var task: Task {
        switch self {
        case .channelsList:
            var params: [String: Any] = [:]
            params["UserAgent"] = "AND"
            params["$filter"] = "substringof('MEO_Mobile',AvailableOnChannels) and IsAdult eq false"
            params["$orderby"] = "ChannelPosition asc"
            params["$inlinecount"] = "allpages"

            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
            
        case .channelNowAndNext(let callLetter):
            var params: [String: Any] = [:]
            params["UserAgent"] = "AND"
            params["$filter"] = "CallLetter eq '\(callLetter)'"
            
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
