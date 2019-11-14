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
import Swinject
import YoutubeKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var tableCollectionView: UICollectionView!
    
    private var viewModel: HomeViewModel!
    private let disposeBag = DisposeBag()
    
    private var viewDidLoadSubject = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableCollectionView.register(DefaultVideoCollectionCell.self, forCellWithReuseIdentifier: "DefaultVideoCollectionCell")
        
        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self

        configureViewModel()
        viewDidLoadSubject.onNext(())
    }
}

// MARK: CollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        
        switch collectionView.tag {
        case 0:
            count = viewModel.animeVideoList.count
        case 1:
            count = viewModel.musicVideoList.count
        case 2:
            count = viewModel.sportsVideoList.count
        default:
            break
        }
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionCell", for: indexPath) as! VideoCollectionCell
        
        switch collectionView.tag {
        case 0:
            cell.configureDataSource(source: viewModel.animeVideoList[indexPath.row])
        case 1:
            cell.configureDataSource(source: viewModel.musicVideoList[indexPath.row])
        case 2:
            cell.configureDataSource(source: viewModel.sportsVideoList[indexPath.row])
        default:
            break
        }
        return cell
    }
}

//MARK: Setup

extension HomeViewController {
    private func configureViewModel() {
        viewModel = HomeViewModel(videoListApi: resolver.resolve(VideoListApi.self)!)
        
        let input = HomeViewModel.Input(viewDidLoad: viewDidLoadSubject.asSignal(onErrorSignalWith: Signal.empty()))
        
        let output = viewModel.build(input)
        
        output
        .reloadAnime
            .drive(onNext: { _ in
                self.tableCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output
        .reloadMusic
            .drive(onNext: { _ in
                self.tableCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output
        .reloadSports
            .drive(onNext: { _ in
                self.tableCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

//MARK: DI

extension HomeViewController {
    private var resolver: Resolver {
        let assembler = Assembler([HomeViewModelAssembly()])
        return assembler.resolver
    }
}
