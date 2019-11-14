//
//  VideoCollectionCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/08.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit
import SnapKit
import Nuke

final class VideoCollectionCell: UICollectionViewCell {
    private lazy var videoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()
    
    private lazy var durationLabel: PaddingLabel = {
        let label = PaddingLabel(top: 3.0, left: 2.0, bottom: 3.0, right: 2.0)
        label.textColor = .white
        label.backgroundColor = .black
        label.alpha = 0.8
        label.layer.cornerRadius = 4.0
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    private var videoFooterView = VideoFooterView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(videoImageView)
        contentView.addSubview(durationLabel)
        contentView.addSubview(videoFooterView)
        
        layer.cornerRadius = 10.0
        clipsToBounds = true
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDataSource(source: Video) {
        guard
            let snippet = source.snippet,
            let contentDetails = source.contentDetails,
            let statistics = source.statistics else { return }
        
        if let urlStr = snippet.thumbnails.high.url, let url = URL(string: urlStr) {
            
            Nuke.loadImage(with: url, into: videoImageView)
        }
        
        if  contentDetails.duration.isPTMS() {
            let str = contentDetails.duration
            let duration = str.toMS()
            
            durationLabel.text = duration
        }
        
        videoFooterView.titleLabel.text = snippet.title
        videoFooterView.channelNameLabel.text = snippet.channelTitle.addMidPoint()
        videoFooterView.viewsCountLabel.text = statistics.viewCount.formatIntString() + "回視聴"
        videoFooterView.updatedAtLabel.text  = snippet.publishedAt.formatDateString()
        
    }
    
    private func configureConstraints() {
        videoImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(135)
        }
        
        durationLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-4)
            make.bottom.equalTo(videoImageView.snp.bottom).offset(-4)
        }
        
        videoFooterView.snp.makeConstraints { make in
            make.top.equalTo(videoImageView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
            make.width.equalTo(videoImageView)
        }
    }
}
