//
//  SegmentSearchViewModel.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/13.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class SegmentSearchViewModel {
    private var searchApi: VideoSearchApi
    private var videoApi: VideoListApi
    
    private let loading = PublishRelay<Bool>()
    
    var videos: [Snippet.SearchList] = []
    
    init(searchApi: VideoSearchApi, videoApi: VideoListApi) {
        self.searchApi = searchApi
        self.videoApi = videoApi
    }
    
    struct Input {
        let segmentChanged: Driver<Int>
    }
    
    struct Output {
        let reload: Driver<Void>
        let loading: Driver<Bool>
    }
    
    
    func build(_ input: Input) -> Output {
        let reload = input
            .segmentChanged
            .asObservable()
            .do(onNext: { index in
                print(index)
                self.loading.accept(true)
            })
            .flatMap { index in
                self.searchApi.searchVideos(part: [.id, .snippet],
                                            maxResults: 50,
                                            regionCode: "JP",
                                            resourceType: [.video],
                                            videoCategoryID: index.transrateToCategoryId())
            }
            .do(onNext: { list in
                self.videos = list.items.map {$0.snippet}
                self.loading.accept(false)
            })
            .map { _ in ()}
            .asDriver(onErrorDriveWith: Driver.empty())
        
        return Output(reload: reload,
                      loading: loading.asDriver(onErrorDriveWith: Driver.empty()))
    }
}
