//
//  VideoSearchViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/31.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Swinject
import YoutubeKit

enum Segment: Int {
    case music = 0
    case game = 1
    case news = 2
    case anime = 3
}

final class VideoSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private var viewModel: VideoSearchViewModel!
    private let disposeBag = DisposeBag()
    
    private let indicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureComponetns()
    }
}

// MARK: TableViewDelegate

extension VideoSearchViewController: UITableViewDelegate, UITableViewDataSource {
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

// MARK: Setup

extension VideoSearchViewController {
    private func configureComponetns() {
        view.backgroundColor = .black
        
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VideoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 240
        tableView.backgroundColor = .clear
        
        searchBar.backgroundColor = .black
        searchBar.alpha = 0.8
        searchBar.barTintColor = .black
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.borderStyle = .roundedRect
        
        indicator.center = view.center
        indicator.style = .large
        indicator.color = .white

        view.addSubview(indicator)
    }
    
    private func configureViewModel() {
        viewModel = VideoSearchViewModel(searchApi: resolver.resolve(VideoSearchApi.self)!,
                                         videoApi: resolver.resolve(VideoListApi.self)!)
        
        let input = VideoSearchViewModel.Input(texDidChange: self.searchBar.rx.text.orEmpty.asDriver(onErrorDriveWith: Driver.empty()))
        
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

//MARK: DI

extension VideoSearchViewController {
    private var resolver: Resolver {
        let assembler = Assembler([VideoSearchViewModelAssembly()])
        return assembler.resolver
    }
}
