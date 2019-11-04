//
//  ViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/30.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YoutubeKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var videoTableView: UITableView!
    
    private var action: HomeActionCreator!
    private var videoStore: CategorizedVideosStore!
    private var initialStore: HomeInitialStore!
    
    private var videos: [[Video]]!
    private var section: Int = 0
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStore()
        configureAction()
        
        videoTableView.register(UINib(nibName: "VideoCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoCollectionTableViewCell")
    }
}

// MARK: CollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.layer.cornerRadius = 15.0
        cell.clipsToBounds = true
        
        guard let videos = self.videos, videos.count > 0 else {
            return cell
        }
        
        cell.bind(videos[section][indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCollectionTableViewCell", for: indexPath) as! VideoCollectionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView = UIView(frame: CGRect(x: 10, y: 10, width: tableView.frame.width, height: 50))
        
        headerView.backgroundColor = .black
        
        let label = UILabel(frame: CGRect(x: 8, y: 8, width: 100, height: 30))
        
        label.text = "HeaderTitle"
        label.textColor = .white
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 300
        return UITableView.automaticDimension
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

//MARK: Store

extension HomeViewController {
    private func configureStore() {
        videoStore = AppDelegate.container.resolve(CategorizedVideosStore.self)
        initialStore = AppDelegate.container.resolve(HomeInitialStore.self)
        
        videoStore
            .videosList
            .asDriver(onErrorDriveWith: Driver.empty())
            .drive(onNext: { [weak self] videoLists in
                self?.videos = videoLists.map { $0.list.items }
                self?.videoTableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        initialStore
            .initialState
            .subscribe(onNext: { initialState in
                <#code#>
            })
            .disposed(by: disposeBag)
    }
}

//MARK: Action

extension HomeViewController {
    private func configureAction() {
        action = AppDelegate.container.resolve(HomeActionCreator.self)
        
        action
            .fetchCategorizedVideos(rx.viewWillAppear.asObservable())
            .subscribe(onNext: { _ in
                print("Did fetchCategorizedVideos")
            })
            .disposed(by: disposeBag)
    }
}

