//
//  TableHeaderView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import SnapKit

final class TableHeaderView: UIView {
    private var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    private var rightButton: UIButton = {
        let button = PaddingButton(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: 10, width: 100, height: 40))
        button.titleLabel?.tintColor = .white
        button.backgroundColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        addSubview(titleLabel)
        addSubview(rightButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        self.titleLabel.text = title
    }
    
    func setRightButtonTitle(title: String) {
        self.rightButton.setTitle(title, for: .normal)
    }
}
