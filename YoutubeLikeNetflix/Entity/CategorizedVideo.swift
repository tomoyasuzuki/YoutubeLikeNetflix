//
//  CategorizedVideo.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/04.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import YoutubeKit

struct CategorizedVideo: StateProtocol {
    let title: String
    let list: VideoList
}
