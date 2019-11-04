//
//  VideoCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/03.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import SnapKit
import YoutubeKit

final class VideoCell: UICollectionViewCell, YTSwiftyPlayerDelegate {
    
    private var player: YTSwiftyPlayer!
    private var id: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurePlayer()
        
        player.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoCell {
    func configurePlayer() {
        player = YTSwiftyPlayer(
        frame: CGRect(x: 0, y: 0, width: 375, height: 237),
        playerVars: [
            .playsInline(true),
            .videoID(self.id),
            .loopVideo(true),
            .showRelatedVideo(false)
        ])
        
        player.autoplay = false
        
        // Set player view
        addSubview(player)

        // Set delegate for detect callback information from the player
        player.delegate = self
        
        // Load video player
        player.loadPlayer()
    }
    
    func bind(_ video: Video) {
        self.id = video.id
    }
}
