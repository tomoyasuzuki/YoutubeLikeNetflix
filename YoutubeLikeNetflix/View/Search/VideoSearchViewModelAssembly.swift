//
//  VideoSearchViewModelAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class VideoSearchViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(VideoSearchViewModel.self) { r in
            VideoSearchViewModel(searchApi: r.resolve(VideoSearchApi.self)!,
                                 videoApi: r.resolve(VideoListApi.self)!)
        }
    }
}
