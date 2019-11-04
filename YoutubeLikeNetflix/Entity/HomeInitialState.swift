//
//  HomeInitialState.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/04.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import YoutubeKit

struct HomeInitialState: StateProtocol {
    let headerTitle: String
    let videos: [Video]
    let numberOfTableViewRows: Int
    let numberOfCollectionViewSections: Int
    let numberOfCollectionViewRowsInSection: Int
    
    init(headerTitle: String = "Home",
         videos: [Video] = [],
         numberOfTableViewRows: Int = 3,
         numberOfCollectionViewSections: Int = 1,
         numberOfCollectionViewRowsInSection: Int = 5) {
        
        self.headerTitle = headerTitle
        self.videos = videos
        self.numberOfTableViewRows = numberOfTableViewRows
        self.numberOfCollectionViewSections = numberOfCollectionViewSections
        self.numberOfCollectionViewRowsInSection = numberOfCollectionViewRowsInSection
    }
}
