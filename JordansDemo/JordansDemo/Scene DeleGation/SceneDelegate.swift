//
//  SceneDelegate 2.swift
//  JordansDemo
//
//  Created by Jordan McKnight on 4/25/25.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        // Initialize the window
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        // Set up the root view controller
        let rootVC = ViewController() // Ensure this is a valid UIViewController subclass
        let navController = UINavigationController(rootViewController: rootVC)

        // Assign the navigation controller to the window's rootViewController
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }

    // Additional lifecycle methods (if needed)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Handle when the scene is disconnected.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Handle when the scene becomes active.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Handle when the scene will resign active.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Handle when the scene will enter foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Handle when the scene enters background.
    }
}
