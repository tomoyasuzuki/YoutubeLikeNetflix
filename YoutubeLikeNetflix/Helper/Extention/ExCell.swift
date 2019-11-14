//
//  ExCell.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/13.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func fadeIn(indexPath: IndexPath) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                self.alpha = 1
        })
    }
}
