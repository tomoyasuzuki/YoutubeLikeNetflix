//
//  VideoThumbnailCollectionViewCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/05.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit
import Nuke
import SnapKit

class VideoThumbnailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureComponents()
    }
    
    private func configureComponents() {
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.clipsToBounds = true
        
        channelImageView.layer.cornerRadius = channelImageView.frame.height / 2
        channelImageView.clipsToBounds = true
        channelImageView.contentMode = .scaleAspectFit
        channelImageView.sizeThatFits(CGSize(width: 45, height: 45))
    }
    
    func configureDataSource(source: Video) {
        guard
            let snippet = source.snippet,
            let contentDetails = source.contentDetails else { return }
        
        if let urlStr = snippet.thumbnails.default.url, let url = URL(string: urlStr) {
            
            Nuke.loadImage(with: url, into: thumbnailImageView)
        }
        
        channelImageView.image = UIImage(named: "placeholder")
        
        if  contentDetails.duration.isPTMS() {
            let str = contentDetails.duration
            let duration = str.toMS()
            
            durationLabel.text = duration
        }
        
        titleLabel.text = snippet.title
    }
 }
