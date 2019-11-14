//
//  PaddingButton.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

final class PaddingButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
