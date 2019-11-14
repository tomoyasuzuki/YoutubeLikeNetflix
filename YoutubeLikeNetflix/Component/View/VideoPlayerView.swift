//
//  VideoPlayerView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit

public let screen = UIScreen.main.bounds

class VideoPlayerView: UIView, YTSwiftyPlayerDelegate {
    
    var id: String?
    
    private var player: YTSwiftyPlayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoPlayerView {
    func configureVideo(_ id: String) {
        player = YTSwiftyPlayer(
            frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.width * 0.56),
            playerVars: [
                .playsInline(true),
                .videoID(id),
                .loopVideo(true),
                .showRelatedVideo(false)
            ])

        player.autoplay = true
        
        addSubview(player)

        player.delegate = self
        
        player.loadPlayer()
    }
}
