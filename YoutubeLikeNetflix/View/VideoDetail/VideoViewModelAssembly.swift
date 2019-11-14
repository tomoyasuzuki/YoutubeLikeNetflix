//
//  VideoViewModelAssembly.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Swinject

final class VideoDetailViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(VideoDetailViewModel.self) { r in
            VideoDetailViewModel(channelApi: r.resolve(ChannelListApi.self)!,
                                 commentListApi: r.resolve(CommentListAPi.self)!)}
    }
}
