//
//  AppDelegate.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/10/30.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var container: Container = {
        let container = Container()
        container.register(YoutubeDataApiClient.self) { _ in YoutubeDataApiClient()}
        
        container.register(VideoListApi.self) { r in VideoListApi(api: r.resolve(YoutubeDataApiClient.self)!)}
        
        container.register(Dispatcher.self) { _ in Dispatcher() }.inObjectScope(.container)
        
        container.register(VideoCategoryListApi.self) { r in VideoCategoryListApi(api: r.resolve(YoutubeDataApiClient.self)!)}
        
        container.register(HomeActionCreator.self) { r in
            HomeActionCreator(videoListApi: r.resolve(VideoListApi.self)!, videoCategoryListApi: r.resolve(VideoCategoryListApi.self)!, dispatcher: r.resolve(Dispatcher.self)!)}
        
        container.register(CategorizedVideosStore.self) { r in CategorizedVideosStore(dispatcher: r.resolve(Dispatcher.self)!)}
        
        container.register(HomeInitialStore.self) { r in HomeInitialStore(dispatcher: r.resolve(Dispatcher.self)!)}
        
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: YoutubeKitTestViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

