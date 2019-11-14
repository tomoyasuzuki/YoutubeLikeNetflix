//
//  CollectionTableViewCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/08.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import SnapKit

class CollectionTableViewCell: UITableViewCell {
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: 200, height: 100), collectionViewLayout: layout)
        
        collectionView.collectionViewLayout = layout
        
        collectionView.backgroundColor = .black
        collectionView.isScrollEnabled = true
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        
        configureCollectionView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CollectionTableViewCell {
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.backgroundColor = .black
        collectionView.isScrollEnabled = true
    }
    
    func setCollectionViewDatasourceAndDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ source: D, forRow row: Int) {
        collectionView.dataSource = source
        collectionView.delegate = source
        
        collectionView.reloadData()
    }
    
    func bindTag(tag: Int) {
        collectionView.tag = tag
    }
}
