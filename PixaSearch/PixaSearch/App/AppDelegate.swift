//
//  AppDelegate.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import UIKit
import AlamofireImage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.setupAlamofireImage()
        return true
    }

    // MARK: - AlamofireImage

    private func setupAlamofireImage() {
        ImageResponseSerializer.addAcceptableImageContentTypes(["binary/octet-stream"])
    }
}
