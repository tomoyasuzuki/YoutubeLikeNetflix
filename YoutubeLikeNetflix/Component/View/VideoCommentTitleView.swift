//
//  VideoCommentTitleView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import UIKit
import YoutubeKit

protocol CommentsSettingsDelegate {
    func changeSortType()
}

class VideoCommentTitleView: UIView {
    @IBOutlet weak var commentTitleLabel: UILabel!
    @IBOutlet weak var commentDefaultImageView: UIImageView!
    @IBOutlet weak var settingButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNib() {
        let view = Bundle.main.loadNibNamed("VideoCommentTitleView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}

//MARK: Setup

extension VideoCommentTitleView {
    func configureComponents() {
        commentDefaultImageView.layer.cornerRadius = commentDefaultImageView.frame.height / 2
        commentDefaultImageView.clipsToBounds = true
    }
    
    func configureDataSource(_ comments: CommentList) {
        commentTitleLabel.text = "コメント： \(comments.items.count)"
        commentDefaultImageView.image = UIImage(named: "")
        settingButton.setImage(UIImage(named: ""), for: .normal)
        settingButton.addTarget(self, action: #selector(changeSettings(_:)), for: .touchUpInside)
    }
    
    
    @objc func changeSettings(_ sender: AnyObject) {
        // delegateを使用してタップ時に出したコンポーネントで変更されたsortタイプをViewControllerに伝える
    }
}
