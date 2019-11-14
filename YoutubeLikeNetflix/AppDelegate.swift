//
//  AppDelegate.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/30.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import YoutubeKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var container: Container = {
        let container = Container()
        container.register(YoutubeDataApiClient.self) { _ in YoutubeDataApiClient()}
        
        container.register(VideoListApi.self) { r in VideoListApi(api: r.resolve(YoutubeDataApiClient.self)!)}
        
        container.register(VideoCategoryListApi.self) { r in VideoCategoryListApi(api: r.resolve(YoutubeDataApiClient.self)!)}
        
        
        container.register(HomeViewModel.self) { r in HomeViewModel(videoListApi: r.resolve(VideoListApi.self)!)}
        
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        YoutubeKit.shared.setAPIKey("AIzaSyAEPf7ECV1oqdTuGnUzOrRa9TgShnIFJxY")
        return true
    }
}

