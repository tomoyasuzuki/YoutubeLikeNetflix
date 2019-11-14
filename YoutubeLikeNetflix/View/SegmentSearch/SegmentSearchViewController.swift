//
//  SegmentSearchViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/13.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SegmentSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    private var viewModel: SegmentSearchViewModel!
    private let disposeBag = DisposeBag()
    
    private let indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        configureComponents()
    }
}

//MARK: TableViewDelegate

extension SegmentSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        
        cell.view.configureDataSource(viewModel.videos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.fadeIn(indexPath: indexPath)
    }
}

//MARK: Setup

extension SegmentSearchViewController {
    private func configureComponents() {
        view.backgroundColor = .black
        
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VideoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 240
        tableView.backgroundColor = .clear
        
        segment.backgroundColor = .white
        segment.tintColor = .black
        
        indicator.center = view.center
        indicator.style = .large
        indicator.color = .white

        view.addSubview(indicator)
    }
    
    private func configureViewModel() {
        viewModel = SegmentSearchViewModel(searchApi: VideoSearchApi(api: YoutubeDataApiClient()),
        videoApi: VideoListApi(api: YoutubeDataApiClient()))
        
        let input = SegmentSearchViewModel.Input(segmentChanged: segment.rx.value.asDriver(onErrorDriveWith: Driver.empty()))
        
        let output = viewModel.build(input)
        
        output
            .reload
            .drive(onNext: { _ in
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        output
            .loading
            .drive(onNext: { [weak self] isLoading in
                self?.handleTableViewHidden(isHidden: isLoading)
                
                isLoading ? self?.indicator.startAnimating() : self?.indicator.stopAnimating()
            }).disposed(by: disposeBag)
        
    }
    
    private func handleTableViewHidden(isHidden: Bool) {
        self.tableView.isHidden = isHidden
    }
}
