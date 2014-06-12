//
//  AppDelegate.swift
//  SwiftToDo
//
//  Created by Jeffery Moulds on 6/12/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

import UIKit
//import RootViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        
//        if window {
//            print(window!)
//        }
   
        
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Override point for customization after application launch.
        
        var rootVC = RootViewController()
        
        var navC = UINavigationController(rootViewController: rootVC)
        
        self.window!.rootViewController = navC
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

}

