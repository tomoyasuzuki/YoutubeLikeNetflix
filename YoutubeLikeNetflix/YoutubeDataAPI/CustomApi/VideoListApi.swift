//
//  VideoListApi.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/03.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import YoutubeKit
import RxSwift

final class VideoListApi {
    private var api: YoutubeDataApiClient!
    
    init(api: YoutubeDataApiClient) {
        self.api = api
    }
    
    func fetchPopularVideoList(part: [Part.VideoList],
                               filter: Filter.VideoList,
                               maxResults: Int? = nil,
                               onBehalfOfContentOwner: String? = nil,
                               pageToken: String? = nil,
                               regionCode: String? = nil,
                               videoCategoryID: String? = nil) -> Single<VideoList> {
        
        return api
            .call(VideoListRequest(part: part, filter: filter))
            .map { try! JSONDecoder().decode(VideoList.self, from: $0)}
    }
}
