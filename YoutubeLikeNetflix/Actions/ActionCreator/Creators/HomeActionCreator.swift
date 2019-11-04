//
//  ActionCreator.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/03.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import RxSwift
import RxCocoa
import YoutubeKit

typealias CategorizedVideos = [CategorizedVideo]

extension CategorizedVideos: StateProtocol {}

final class HomeActionCreator {
    private var videoListApi: VideoListApi!
    private var videoCategoryListApi: VideoCategoryListApi!
    private var dispatcher :Dispatcher!
    
    private var categoryList: [VideoCategory] = []
    private var categorizedVideos: CategorizedVideos = []
    
    init(videoListApi: VideoListApi, videoCategoryListApi: VideoCategoryListApi,dispatcher: Dispatcher) {
        self.videoListApi = videoListApi
        self.dispatcher = dispatcher
        self.videoCategoryListApi = videoCategoryListApi
    }
    
    func fetchCategorizedVideos(_ event: Observable<Void> ) -> Observable<Void>{
        videoCategoryListApi
            .fetchVideoCategoryList(part: [.id, .snippet], filter: .regionCode("JP"))
            .map { $0.items }
            .do(onSuccess: { categoryList in
                self.categoryList = categoryList
            })
            .flatMap {_ in self.fetchCategorizedVideoList(self.categoryList[0].id)}
            .do(onSuccess: { videoList in
                let categorizedVideo = CategorizedVideo(title: self.categoryList[0].snippet.title, list: videoList)
                
                self.addCategorizedVideos(categorizedVideo)
            })
            .flatMap {_ in self.fetchCategorizedVideoList(self.categoryList[1].id)}
            .do(onSuccess: { videoList in
                let categorizedVideo = CategorizedVideo(title: self.categoryList[1].snippet.title, list: videoList)
                
                self.addCategorizedVideos(categorizedVideo)
            })
            .flatMap {_ in self.fetchCategorizedVideoList(self.categoryList[2].id)}
            .do(onSuccess: { videoList in
                let categorizedVideo = CategorizedVideo(title: self.categoryList[2].snippet.title, list: videoList)
                
                self.addCategorizedVideos(categorizedVideo)
                
                self.dispatcher.dispatch(state: self.categorizedVideos)
            })
            .asObservable()
            .map { _ in ()}
            
    }
    
    private func fetchCategorizedVideoList(_ categoryId: String) -> Single<VideoList> {
        self.videoListApi
            .fetchPopularVideoList(part: [.id, .snippet, .contentDetails], filter: .chart, videoCategoryID: categoryId)
    }
    
    private func addCategorizedVideos(_ item: CategorizedVideo) {
        self.categorizedVideos.append(item)
    }
}
