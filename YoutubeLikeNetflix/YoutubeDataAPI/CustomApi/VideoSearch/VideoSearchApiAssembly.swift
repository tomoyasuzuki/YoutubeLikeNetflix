//
//  VideoSearchApiAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class VideoSearchApiAssembly: Assembly {
    func assemble(container: Container) {
        container.register(VideoSearchApi.self) { r in VideoSearchApi(api: r.resolve(YoutubeDataApiClient.self)!)}
    }
}


