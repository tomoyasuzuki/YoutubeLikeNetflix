//
//  ChannelListApiAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class ChannelListApiAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CommentListAPi.self) { r in CommentListAPi(api: r.resolve(YoutubeDataApiClient.self)!)}
    }
}
