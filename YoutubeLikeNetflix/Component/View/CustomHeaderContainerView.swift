//
//  CustomHeaderContainerView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import SnapKit

final class CustomHeaderContainerView: UITableViewHeaderFooterView {
    let view = TableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(view)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
