//
//  VideoCollectionTableViewCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/01.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

final class VideoCollectionTableViewCell: UITableViewCell {
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        videoCollectionView.register(VideoCell.self, forCellWithReuseIdentifier: "VideoCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 375, height: 237)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        videoCollectionView.collectionViewLayout = layout
        
        videoCollectionView.backgroundColor = .white
        videoCollectionView.isScrollEnabled = true
    }
}

extension VideoCollectionTableViewCell {
    func setCollectionViewDatasourceAndDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ source: D, forRow row: Int) {
        videoCollectionView.dataSource = source
        videoCollectionView.delegate = source
        
        videoCollectionView.reloadData()
    }
}
