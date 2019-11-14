//
//  VideoCommentView.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit
import Nuke

class VideoCommentView: UIView {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var disLikeImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFit
        
        likeImageView.contentMode = .scaleAspectFit
        disLikeImageView.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNib() {
        let view = Bundle.main.loadNibNamed("VideoCommentView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}

extension VideoCommentView {
    func configureDataSource(_ comment: Comment) {
        let snippet = comment.snippet
        
        let urlString = snippet.authorProfileImageURL
        if let url = URL(string: urlString) {
            Nuke.loadImage(with: url, into: userImageView)
        }
        
        userNameLabel.text = snippet.authorDisplayName
        commentTextView.text = snippet.textDisplay
        
        likeImageView.image = UIImage(named: "")
        disLikeImageView.image = UIImage(named: "")
        
        likeCountLabel.text = snippet.likeCount.description
    }
}
