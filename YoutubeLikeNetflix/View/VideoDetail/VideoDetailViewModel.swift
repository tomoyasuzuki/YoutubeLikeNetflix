//
//  VideoDetailViewModel.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class VideoDetailViewModel {
    var video: Video?
    var channel: Channel?
    var comments: CommentList?
    
    private var channelApi: ChannelListApi!
    private var commentListApi: CommentListAPi!
    
    init(channelApi: ChannelListApi, commentListApi: CommentListAPi) {
        self.channelApi = channelApi
        self.commentListApi = commentListApi
    }
    
    struct Input {
        let viewDidLoad: Driver<Void>
        let _video: Driver<Video>
    }
    
    struct Output {
        let reload: Driver<Void>
    }
    
    func build(_ input: Input) -> Output {
        let video = input
            ._video.do(onNext: { self.video = $0 })
        
        // video情報を元にコメントAPI, チャンネルAPIを叩く
        return Output(reload: Driver.empty())
    }
}


