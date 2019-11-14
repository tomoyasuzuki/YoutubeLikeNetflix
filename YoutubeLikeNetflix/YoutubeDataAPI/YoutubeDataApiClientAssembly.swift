//
//  YoutubeDataApiClientAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class YoutubeDataApiClientAssembly: Assembly {
    func assemble(container: Container) {
        container.register(YoutubeDataApiClient.self) { _ in YoutubeDataApiClient()}
    }
}
