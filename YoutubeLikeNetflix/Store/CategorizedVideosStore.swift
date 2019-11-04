//
//  HomeStore.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/02.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class CategorizedVideosStore {
    private let dispatcher: Dispatcher
    private let disposeBag = DisposeBag()
    
    let videosList = BehaviorSubject<CategorizedVideos>(value: [])
    
    init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
        
        let videos: Observable<CategorizedVideos> = self.dispatcher.observe()
        
        videos.subscribe(onNext: { [weak self] states in
            self?.videosList.onNext(states)
        })
        .disposed(by: disposeBag)
    }
}
