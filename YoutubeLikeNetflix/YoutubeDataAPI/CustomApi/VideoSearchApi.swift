//
//  VideoSearchApi.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/11.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import YoutubeKit

final class VideoSearchApi {
    private var api: YoutubeDataApiClient

    init(api: YoutubeDataApiClient) {
        self.api = api
    }

    func searchVideos(part: [Part.SearchList],
                      filter: Filter.SearchList? = nil,
                      eventType: SearchEventType? = nil,
                      maxResults: Int? = nil,
                      order: ResultOrder.Search? = nil,
                      pageToken: String? = nil,
                      searchQuery: String? = nil,
                      regionCode: String? = nil,
                      topicID: String? = nil,
                      resourceType: [SearchResourceType]? = [.video],
                      videoCategoryID: VideoCategoryID? = nil,
                      videoType: SearchVideoType? = nil) -> Single<SearchList> {
        return api
            .call(SearchListRequest(part: part,
                                    filter: filter,
                                    eventType: eventType,
                                    maxResults: maxResults,
                                    order: order,
                                    pageToken: pageToken,
                                    searchQuery: searchQuery,
                                    regionCode: regionCode,
                                    topicID: topicID,
                                    resourceType: resourceType,
                                    videoCategoryID: videoCategoryID,
                                    videoType: videoType))
            .map { try! JSONDecoder().decode(SearchList.self, from: $0) }
    }
}
