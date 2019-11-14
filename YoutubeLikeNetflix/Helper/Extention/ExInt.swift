//
//  ExInt.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/08.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import YoutubeKit

extension Int {
    func toString() -> String {
        return String(self)
    }
    
    func transrateToCategoryId() -> VideoCategoryID {
        switch self {
        case Segment.music.rawValue:
            return VideoCategoryID.music
        case Segment.game.rawValue:
            return VideoCategoryID.gaming
        case Segment.news.rawValue:
            return VideoCategoryID.newsAndPolitics
        case Segment.anime.rawValue:
            return VideoCategoryID.animeAndAnimation
        default:
            return VideoCategoryID.animeAndAnimation
        }
    }
}
