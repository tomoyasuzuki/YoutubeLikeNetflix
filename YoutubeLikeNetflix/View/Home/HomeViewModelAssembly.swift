//
//  HomeViewModelAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class HomeViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { r in
            HomeViewModel(videoListApi: r.resolve(VideoListApi.self)!)
        }
    }
}
