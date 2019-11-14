//
//  CollectionWrapView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

final class CollectionWrapView: UIView {
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(CollectionContainerCell.self, forCellWithReuseIdentifier: "DefaultVideoCollectionCell")
        
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionWrapView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        switch collectionView.tag {
//        case 0:
//            cell =  delegate.animeCollectionView(collectionView, cellForItemAt: indexPath)
//        case 1:
//            cell =  delegate.musicCollectionView(collectionView, cellForItemAt: indexPath)
//        case 2:
//            cell =  delegate.sportsCollectionView(collectionView, cellForItemAt: indexPath)
//        default:
//            return cell
//        }
//
        return cell
    }
}
