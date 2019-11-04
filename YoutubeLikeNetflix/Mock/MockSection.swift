//
//  MockSection.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/02.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import Foundation

struct MockSection {
    let numberOfRowsInSection: Int
    let sectionTitles: [String]
    
    init(numberOfRowsInSection: Int = 1, sectionTitles: [String] = ["映画", "ドラマ", "アニメ"]) {
        self.numberOfRowsInSection = numberOfRowsInSection
        self.sectionTitles = sectionTitles
    }
}
