//
//  ViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/11.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

protocol CustomCollectionDelegate {
    func animeCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func musicCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func sportsCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class ViewController: UIViewController{
//    func animeCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    func musicCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    func sportsCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
}
