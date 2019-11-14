//
//  CategoryVideosViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/10.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit

final class CategoryVideosViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let cellView = VideoDefaultView()
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "CategoryVideosCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension CategoryVideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryVideosCell", for: indexPath) as! VideoTableViewCell
        cell.view.configureDataSource(source: self.videos[indexPath.row])
        
        return cell
    }
}
