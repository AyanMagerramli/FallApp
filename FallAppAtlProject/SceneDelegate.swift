//
//  SceneDelegate.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var mainCoordinator: MainCoordinator?
    
    // Observe UserDefaults changes, usage of KEY-VALUE OBSERVATION (KVO) design pattern
    private var userDefaultsObservation: NSKeyValueObservation?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        mainCoordinator = MainCoordinator(navigationController: UINavigationController())
        mainCoordinator?.window = window
        
        // Observe changes to the "loggedIn" key in UserDefaults
        userDefaultsObservation = UserDefaults.standard.observe(\.loggedIn, options: [.initial, .new], changeHandler: { [weak self] (_, change) in
            if let loggedIn = change.newValue {
                if loggedIn {
                    self?.mainCoordinator?.start()
                } else {
                    self?.setLoginAsRootController(windowScene: windowScene)
                }
            }
        })
        
        let status = UserDefaults.standard.bool(forKey: "loggedIn")
        if status == true {
            self.mainCoordinator?.start()
        } else {
            self.setLoginAsRootController(windowScene: windowScene)
        }
    }
    
    func setLoginAsRootController(windowScene: UIWindowScene) {
        let controller = LoginViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        let coordinator = MainCoordinator(navigationController: navigationController)
        controller.viewModel = .init(coordinator: coordinator)
        mainCoordinator = coordinator
        mainCoordinator?.window = window
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

