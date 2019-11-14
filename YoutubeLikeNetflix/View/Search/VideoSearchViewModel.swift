//
//  VideoSearchViewModel.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/11.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class VideoSearchViewModel {
    private var searchApi: VideoSearchApi
    private var videoApi: VideoListApi
    
    private let loading = PublishRelay<Bool>()
    
    var videos: [Snippet.SearchList] = []
    
    init(searchApi: VideoSearchApi, videoApi: VideoListApi) {
        self.searchApi = searchApi
        self.videoApi = videoApi
    }
    
    struct Input {
        let texDidChange: Driver<String>
    }
    
    struct Output {
        let loading: Driver<Bool>
        let reload: Driver<Void>
    }
    
    
    func build(_ input: Input) -> Output {
        
        let reload = input
            .texDidChange
            .asObservable()
            .do(onNext: { _ in
                self.loading.accept(true)
            })
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMap { self.searchApi.searchVideos(part: [.id, .snippet],
                                             maxResults: 50,
                                             searchQuery: $0,
                                             regionCode: "JP")
                
            }
            .observeOn(MainScheduler.instance)
            .do(onNext: { list in
                self.videos = list.items.map {$0.snippet}
                self.loading.accept(false)
            })
            .void()
            .asDriverWithEmpty()
        
        return Output(loading: loading.asDriver(onErrorDriveWith: Driver.empty()),
                      reload: reload)
    }
}
