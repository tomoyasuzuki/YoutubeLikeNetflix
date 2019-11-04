//
//  VideoDetailViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/31.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

final class VideoDetailViewController: UIViewController {
    @IBOutlet weak var videoDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        videoDetailTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
    }
}
