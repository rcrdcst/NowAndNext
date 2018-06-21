//
//  MeoServiceType.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import Foundation
import RxSwift

protocol MeoServiceType {
    func channelsList() -> Observable<Channels>
    func channelNowAndNext(callLetter: String) -> Observable<Program>
}

