//
//  ViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/30.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var nsvigationBarView: UIView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var videoTableView: UITableView!
    
    var mockCategory = ["映画", "韓国ドラマ", "アニメ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.register(UINib(nibName: "VideoCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoCollectionTableViewCell")
        videoTableView.sectionHeaderHeight = 60
        videoTableView.backgroundColor = .black
    }
}

// MARK: CollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        cell.setupDatasource(MockVideoItem())
        
        cell.layer.cornerRadius = 10.0

        return cell
    }
}

// MARK: TableviewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let cell = cell as? VideoCollectionTableViewCell else { return }

        cell.setCollectionViewDatasourceAndDelegate(self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCollectionTableViewCell", for: indexPath) as! VideoCollectionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height)) //set these values as necessary
        headerView.backgroundColor = .black
        
        let label = UILabel(frame: CGRect(x: 16, y: 16, width: 100, height: 30))

        label.text = self.mockCategory[section]
        label.textColor = .white
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 216
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockCategory.count
    }
}

