//
//  VideoCategoryListApi.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/04.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class VideoCategoryListApi {
    private var api: YoutubeDataApiClient
    
    init(api: YoutubeDataApiClient) {
        self.api = api
    }
    
    func fetchVideoCategoryList(part: [Part.VideoCategoriesList],
                                filter: Filter.VideoCategoriesList,
                                hl: String? = nil) -> Single<VideoCategoriesList> {
        return api
            .call(VideoCategoriesListRequest(part: part, filter: filter))
            .map { try! JSONDecoder().decode(VideoCategoriesList.self, from: $0)}
    }
}
