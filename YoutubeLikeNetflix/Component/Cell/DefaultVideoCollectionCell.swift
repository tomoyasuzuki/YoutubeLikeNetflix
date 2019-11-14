//
//  DefaultVideoCollectionCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import SnapKit

final class DefaultVideoCollectionCell: UICollectionViewCell {
    var view = VideoDefaultView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(view)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDataSource() {
        
    }
}
