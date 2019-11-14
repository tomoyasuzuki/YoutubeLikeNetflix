//
//  HomeViewModel.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/04.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class HomeViewModel {
    let videoListApi: VideoListApi
    
    var animeVideoList: [Video] = []
    var musicVideoList: [Video] = []
    var sportsVideoList: [Video] = []
    
    init(videoListApi: VideoListApi) {
        self.videoListApi = videoListApi
    }
    
    struct Input {
        let viewDidLoad: Signal<Void>
    }
    
    struct Output {
        let reloadAnime: Driver<Void>
        let reloadMusic: Driver<Void>
        let reloadSports: Driver<Void>
    }
    
    func build(_ input: Input) -> Output {
        let anime = input
            .viewDidLoad
            .asObservable()
            .flatMap { self.videoListApi.fetchPopularVideoList(part: [.id, .snippet, .contentDetails, .statistics], filter: .chart, maxResults: 10, regionCode: "JP", videoCategoryID: VideoCategoryID.animeAndAnimation.rawValue.toString())
            }
            .do(onNext: { list in
                self.animeVideoList = list.items
            })
            .map { _ in ()}
            .asDriver(onErrorDriveWith: Driver.empty())
        
        let music = input
            .viewDidLoad
            .asObservable()
            .flatMap { self.videoListApi.fetchPopularVideoList(part: [.id, .snippet, .contentDetails, .statistics], filter: .chart, maxResults: 10, regionCode: "JP", videoCategoryID: VideoCategoryID.music.rawValue.toString())
            }
            .do(onNext: { list in
                self.musicVideoList = list.items
            })
            .map { _ in ()}
            .asDriver(onErrorDriveWith: Driver.empty())
        
        let sports = input
            .viewDidLoad
            .asObservable()
            .flatMap { self.videoListApi.fetchPopularVideoList(part: [.id, .snippet, .contentDetails, .statistics], filter: .chart, maxResults: 10, regionCode: "JP", videoCategoryID: VideoCategoryID.sports.rawValue.toString())
            }
            .do(onNext: { list in
                self.sportsVideoList = list.items
            })
            .map { _ in ()}
            .asDriver(onErrorDriveWith: Driver.empty())
        
        return Output(reloadAnime: anime, reloadMusic: music, reloadSports: sports)
    }
}
