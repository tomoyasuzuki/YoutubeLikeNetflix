//
//  CommentListApi.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxCocoa
import RxSwift
import YoutubeKit

final class CommentListAPi {
    private var api: YoutubeDataApiClient

    init(api: YoutubeDataApiClient) {
        self.api = api
    }

    func fetchCommentList(part: [Part.ChannelList],
                          filter: Filter.ChannelList,
                          maxResult: Int? = nil,
                          onBehalfOfContentOwner: String? = nil,
                          pageToken: String? = nil) -> Single<ChannelList> {
        return api
            .call(ChannelListRequest(part: part,
                                     filter: filter,
                                     maxResult: maxResult,
                                     onBehalfOfContentOwner: onBehalfOfContentOwner,
                                     pageToken: pageToken))
            .map { try! JSONDecoder().decode(ChannelList.self, from: $0) }
    }
}
