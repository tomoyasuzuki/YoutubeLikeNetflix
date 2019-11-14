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
        
        videoCollectionView.register(VideoCollectionCell.self, forCellWithReuseIdentifier: "VideoCollectionCell")
        
        videoCollectionView.backgroundColor = .black
        videoCollectionView.isScrollEnabled = true
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        videoCollectionView.collectionViewLayout = layout
    }
}

extension VideoCollectionTableViewCell {
    func setCollectionViewDatasourceAndDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ source: D, forRow row: Int) {
        videoCollectionView.dataSource = source
        videoCollectionView.delegate = source
        
        videoCollectionView.reloadData()
    }
    
    func bindTag(tag: Int) {
        videoCollectionView.tag = tag
    }
}
