//
//  AppDelegate.swift
//  SwitchableViewController
//
//  Created by ichikawa on 2020/10/31.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = RootViewController.instantiate()
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()

        return true
    }
}

