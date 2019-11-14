//
//  SegmentSearchViewModelAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class SegmentSearchViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SegmentSearchViewModel.self) { r in
            SegmentSearchViewModel(searchApi: r.resolve(VideoSearchApi.self)!,
                                   videoApi: r.resolve(VideoListApi.self)!)}
    }
}
