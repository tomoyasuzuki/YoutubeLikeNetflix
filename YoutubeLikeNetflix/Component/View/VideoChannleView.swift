//
//  VideoChannleView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit
import Nuke

class VideoChannelView: UIView {
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var channelDescriptionLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNib() {
        let view = Bundle.main.loadNibNamed("VideoChannelView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}

extension VideoChannelView {
    private func configureComponents() {
        channelImageView.layer.cornerRadius = channelImageView.frame.height / 2
        channelImageView.clipsToBounds = true
        
        //TODO: PaddingButtonを差し替えた方がいいかも
        registerButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    func configureDataSource(_ channel: Channel) {
        guard let snippet = channel.snippet else { return }
        
        if let urlString = snippet.thumbnails.url, let url = URL(string: urlString) {
            Nuke.loadImage(with: url, into: channelImageView)
        }
        
        channelTitleLabel.text = snippet.title
        
        if let statistics = channel.statistics {
            channelDescriptionLabel.text = "チャンネル登録者数： \(statistics.subscriberCount)"
        }
    }
}
