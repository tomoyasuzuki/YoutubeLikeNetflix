//
//  VideoCollectionViewCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/31.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import WebKit

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var videoWebView: WKWebView!
    @IBOutlet weak var videoChannelImageView: UIImageView!
    @IBOutlet weak var mockView: UIView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    @IBOutlet weak var mockButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        videoChannelImageView.layer.cornerRadius = videoChannelImageView.frame.height / 2
        videoChannelImageView.clipsToBounds = true
        videoChannelImageView.layer.borderColor = UIColor.black.cgColor
        videoChannelImageView.layer.borderWidth = 1.0
    }
}

extension VideoCollectionViewCell {
    func setupDatasource(_ videoItem: MockVideoItem) {
        videoTitleLabel.text = videoItem.title
        videoChannelImageView.image = videoItem.createrImage
    }
}
