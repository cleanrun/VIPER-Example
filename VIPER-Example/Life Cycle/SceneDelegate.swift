//
//  SceneDelegate.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let vc = MovieListRouter.createModule()
        let navVc = UINavigationController(rootViewController: vc)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navVc
        window?.makeKeyAndVisible()
    }

}

