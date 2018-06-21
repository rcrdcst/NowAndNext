//
//  HomeVM.swift
//  NowAndNext
//
//  Created by ricardo silva on 21/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import RxSwift

final class HomeVM {
    
    private var handler: MeoService
    
    
    init() {
        self.handler = MeoService()
    }
    
    func channels() -> Observable<[Program]> {
        return handler.channelsList().map({ result -> [ChannelsValue] in
                return result.value
            }).flatMap { channels -> Observable<[Program]> in
                return Observable.from(channels).flatMap({ channels -> Observable<Program> in
                    return self.handler.channelNowAndNext(callLetter: channels.callLetter)
            }).toArray()
        }
    }
    
    
    
    
}
