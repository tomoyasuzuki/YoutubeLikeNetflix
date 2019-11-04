//
//  VideosState.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/04.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import YoutubeKit

final class VideosState: StateProtocol {
    let videos: [Video]
    
    init(videos: [Video]) {
        self.videos = videos
    }
}
