//
//  AppDelegate.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import UIKit

@main final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDependencies()
        return true
    }

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

private extension AppDelegate {
    func setupDependencies() {
        DependencyContainer.setDependency(initialValue: Webservice(), key: WebserviceDependencyKey.self)
    }
}
