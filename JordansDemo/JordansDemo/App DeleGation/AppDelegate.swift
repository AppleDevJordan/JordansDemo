//
//  AppDelegate.swift
//  JordansDemo
//
//  Created by Jordan McKnight on 4/25/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Create and configure the window
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        // Instantiate your view controller
        let rootVC = ViewController() // Replace ViewController with the appropriate UIViewController class
        let navController = UINavigationController(rootViewController: rootVC)

        // Set the navigation controller as the root view controller
        window.rootViewController = navController
        window.makeKeyAndVisible()

        return true
    }
}
