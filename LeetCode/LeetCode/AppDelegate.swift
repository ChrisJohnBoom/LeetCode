//
//  AppDelegate.swift
//  LeetCode
//
//  Created by 杜志 on 2021/2/10.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = ViewController.init()
        window?.makeKeyAndVisible()

        return true
    }
}

