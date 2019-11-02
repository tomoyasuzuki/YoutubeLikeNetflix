//
//  VideoView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/31.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import WebKit

final class VideoView: UIView {
    private var mockView: UIView = {
        let view = UIView()
        return view
    }()
//    private var videoWebView: WKWebView = {
//        return WKWebView()
//    }()
    
    private var videoFooterView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var videoStartButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var videoTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.addSubview(mockView)
        self.addSubview(videoFooterView)
        self.addSubview(videoStartButton)
        self.addSubview(videoTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
