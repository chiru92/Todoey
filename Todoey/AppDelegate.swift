//
//  AppDelegate.swift
//  Todoey
//
//  Created by Qrati Labs on 5/22/20.
//  Copyright © 2020 Qrati Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("AppDidFinishLaunching")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("AppWillResignActive")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDidEnterBackground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("AppWillTerminate")
    }

}

