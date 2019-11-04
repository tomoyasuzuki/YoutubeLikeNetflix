//
//  MockVideoItem.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/01.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Foundation
import UIKit

struct MockVideoItem {
    let title: String
    let createrName: String
    let createrImage: UIImage
    let duration: Double
    let urlString: String
    
    init(title: String = "VideoTitle", createrName: String = "CreaterName", createrImage: UIImage = UIImage(named: "mockImage")!, duration: Double = 400, urlString: String = "https://hogehoge.com") {
        self.title = title
        self.createrName = createrName
        self.createrImage = createrImage
        self.duration = duration
        self.urlString = urlString
    }
}
