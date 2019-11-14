//
//  CollectionViewWrapCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import SnapKit

final class CollectionContainerCell: UICollectionViewCell {
    
    var itemSize = CGRect.zero
    
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        collectionView.backgroundColor = .black
        collectionView.isScrollEnabled = true
        collectionView.collectionViewLayout = layout
        
        collectionView.register(DefaultVideoCollectionCell.self, forCellWithReuseIdentifier: "DefaultVideoCollectionCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionContainerCell {
    func setCollectionViewDatasourceAndDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ source: D, forRow row: Int) {
        collectionView.dataSource = source
        collectionView.delegate = source
        
        collectionView.reloadData()
    }
    
    func bindTag(tag: Int) {
        collectionView.tag = tag
    }
}
