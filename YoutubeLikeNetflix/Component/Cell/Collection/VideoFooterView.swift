//
//  VideoFooterView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/08.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

final class VideoFooterView: UIView {
    var channelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    var channelNameLabel: UILabel = {
        let label = SubTitleLabel()
        return label
    }()
    
    var viewsCountLabel: SubTitleLabel = {
        let label = SubTitleLabel()
        label.contentHuggingPriority(for: .horizontal)
        return label
    }()
    
    var updatedAtLabel: UILabel = {
        let label = SubTitleLabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(channelImageView)
        addSubview(titleLabel)
        addSubview(channelNameLabel)
        addSubview(viewsCountLabel)
        addSubview(updatedAtLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        channelImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-24)
            make.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(channelImageView)
            make.left.equalTo(channelImageView.snp.right).offset(8)
            make.right.lessThanOrEqualToSuperview().offset(-8)
        }
        
        channelNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.width.lessThanOrEqualTo(100)
            make.left.equalTo(titleLabel)
        }
        
        viewsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(channelNameLabel)
            make.left.equalTo(channelNameLabel.snp.right)
        }
        
        updatedAtLabel.snp.makeConstraints { make in
            make.top.equalTo(channelNameLabel.snp.bottom).offset(2)
            make.left.equalTo(channelNameLabel)
        }
    }
}
