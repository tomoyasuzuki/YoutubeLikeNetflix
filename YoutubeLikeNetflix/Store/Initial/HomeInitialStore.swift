//
//  HomeInitialStore.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/04.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class HomeInitialStore {
    private let dispatcher: Dispatcher
    private let disposeBag = DisposeBag()
    
    let initialState = BehaviorSubject<HomeInitialState>(value: HomeInitialState())
    
    init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
        
        let initialState: Observable<HomeInitialState> = self.dispatcher.observe()
        
        initialState.subscribe(onNext: { [weak self] states in
            self?.initialState.onNext(states)
        })
        .disposed(by: disposeBag)
    }
}
