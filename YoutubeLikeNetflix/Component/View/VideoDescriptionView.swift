//
//  VideoDescriptionView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit

class VideoDescriptionView: UIView {
    @IBOutlet weak var textView: VideoDescriptionView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension VideoDescriptionView {
    private func configureComponents() {
        // 現状特別な処理はない
    }
}
