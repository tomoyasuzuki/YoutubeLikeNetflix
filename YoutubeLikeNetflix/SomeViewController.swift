//
//  SomeViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/08.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit

class SomeViewController: UIViewController {
    
    let viewModel = AppDelegate.container.resolve(HomeViewModel.self)
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .black
    }
}

extension SomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "somecell", for: indexPath)
        
        return cell
    }
}
