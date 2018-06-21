//
//  MeoService.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import RxSwift
import Moya

struct MeoService: MeoServiceType {
    
    private var unsplash: MoyaProvider<MeoAPI>
    
    
    init(unsplash: MoyaProvider<MeoAPI> = MoyaProvider<MeoAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])) {
        self.unsplash = unsplash
    }
    
    func channelsList() -> Observable<Channels> {
        return unsplash.rx
            .request(.channelsList())
            .filterSuccessfulStatusCodes()
            .map(Channels.self)
            .asObservable()
    }
    
    func channelNowAndNext(callLetter: String) -> Observable<Program> {
        return unsplash.rx
            .request(.channelNowAndNext(callLetter: callLetter))
            .filterSuccessfulStatusCodes()
            .map(Program.self)
            .asObservable()
    }
    
}
