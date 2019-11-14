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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        YoutubeKit.shared.setAPIKey("AIzaSyAEPf7ECV1oqdTuGnUzOrRa9TgShnIFJxY")
        return true
    }
}

