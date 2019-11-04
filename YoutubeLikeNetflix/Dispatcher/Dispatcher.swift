//
//  Dispatcher.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/02.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class Dispatcher {
    private let subject = PublishSubject<StateProtocol>()
    
    public func dispatch(state: StateProtocol) {
        subject.onNext(state)
    }
    
    public func observe<T: StateProtocol>() -> Observable<T> {
        return subject.asObservable().compactMap {$0 as? T}
    }
}
