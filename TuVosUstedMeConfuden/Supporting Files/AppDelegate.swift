//
//  AppDelegate.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 2/26/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import GoogleMobileAds
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vc = ViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UserDefaults.standard.set("English", forKey: "language")
        UserDefaults.standard.set(false, forKey: "tertiaryItemsAreOnScreen")
        UserDefaults.standard.set(false, forKey: "additionalInfoTertiaryWasActive")
        UserDefaults.standard.set(false, forKey: "tertiaryWasActive")
        UserDefaults.standard.set(true, forKey: "baseElementsNeeded")
        UserDefaults.standard.set(false, forKey: "transitionOccuring")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

