//
//  YoutubeKitTestViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/02.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import WebKit
import YoutubeKit

class YoutubeKitTestViewController: UIViewController, YTSwiftyPlayerDelegate {
    private var player: YTSwiftyPlayer!

    @IBOutlet weak var baseView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        player = YTSwiftyPlayer(
            frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300),
                    playerVars: [.playsInline(true),
                    .videoID("_6u6UrtXUEI"),
                    .loopVideo(true),
                    .showRelatedVideo(false)])

        // Enable auto playback when video is loaded
        player.autoplay = true
        
        // Set player view.
        view = player

        // Set delegate for detect callback information from the player.
        player.delegate = self
        
        // Load the video.
        player.loadPlayer()
    }
}
