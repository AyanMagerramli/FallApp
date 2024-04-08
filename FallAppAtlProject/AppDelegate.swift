//
//  AppDelegate.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private func registerCustomFonts() {
        let fonts = Bundle.main.urls(forResourcesWithExtension: "ttf", subdirectory: nil)
        fonts?.forEach { url in
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerCustomFonts()
        // For get rid of white stroke while creating ui table view header or footer:
        if #available(iOS 14.0, *) {
               var bgConfig = UIBackgroundConfiguration.listPlainCell()
               bgConfig.backgroundColor = UIColor.clear
               UITableViewHeaderFooterView.appearance().backgroundConfiguration = bgConfig
               //For cell use: UITableViewCell.appearance().backgroundConfiguration = bgConfig
           }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

