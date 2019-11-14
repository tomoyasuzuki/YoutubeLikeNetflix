//
//  VideoDetailViewController.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/14.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import RxSwift
import RxCocoa
import YoutubeKit

final class VideoDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: VideoDetailViewModel!
    
    private var video: Video?
    private let _video = PublishSubject<Video>()
    private let _viewDidLoad = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureComponents()
        
        guard let video = self.video else { return }
        _video.onNext(video)
        _viewDidLoad.onNext(())
    }
}

extension VideoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // PlayerView
        case 1:
            return 1 // ChannleView
        case 2:
            return 1 // CommentTitleView
        case 3:
            guard let comments = viewModel.comments else { return 1 }
            return comments.items.count // Comments
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath)
        
        guard let video = viewModel.video else { return cell }
        
        switch indexPath.section {
        case 0:
            let view = VideoPlayerView()
            view.configureVideo(video.id)
            cell.addSubview(view)
        case 1:
            guard let channel = viewModel.channel else { return cell }
            let view = VideoChannelView()
            view.configureDataSource(channel)
            cell.addSubview(view)
        case 2:
            let view = VideoCommentTitleView()
            if let comments = viewModel.comments {
                view.configureDataSource(comments)
            }
            cell.addSubview(view)
        case 3:
            let view = VideoCommentView()
            if let comments = viewModel.comments {
                view.configureDataSource(comments.items[indexPath.row + 3])
            }
            cell.addSubview(view)
        default:
            break
        }
        
        return cell
    }
    
    
}

//MARK: Setup

extension VideoDetailViewController {
    private func configureComponents() {
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VideoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureViewModel() {
        viewModel = VideoDetailViewModel(channelApi: ChannelListApi(api: YoutubeDataApiClient()), commentListApi: CommentListAPi(api: YoutubeDataApiClient()))
        
        let input = VideoDetailViewModel.Input(viewDidLoad: self._viewDidLoad.asDriverWithEmpty())
    }
}
