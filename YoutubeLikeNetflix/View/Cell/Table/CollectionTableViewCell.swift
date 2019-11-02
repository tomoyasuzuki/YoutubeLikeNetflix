//
//  CollectionTableViewCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/31.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    private var videoCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(videoCollectionView)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionTableViewCell {
    private func configureCollectionView() {
        
    }
}

extension CollectionTableViewCell {
    func setCollectionViewDatasourceAndDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ source: D, forRow row: Int) {
        videoCollectionView.dataSource = source
        videoCollectionView.delegate = source
        
        videoCollectionView.reloadData()
    }
}
