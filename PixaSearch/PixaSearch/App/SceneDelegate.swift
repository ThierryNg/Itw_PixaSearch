//
//  SceneDelegate.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowScene = windowScene

        window.rootViewController = SceneDelegate.initialScene()
        window.makeKeyAndVisible()
        self.window = window
    }

    private static func initialScene() -> UIViewController {
        let navigation = UINavigationController(
            rootViewController: SearchResultsBuilder.build()
        )
        return navigation
    }
}
