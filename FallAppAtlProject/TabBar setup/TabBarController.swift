//
//  TabBarController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 14.01.24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()      
    }
    
    func setupViewControllers() {
        let firstVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: firstVC)
        firstVC.coordinator = MainCoordinator(navigationController: homeNav)
        firstVC.tabBarItem.title = "Home"
        firstVC.tabBarItem.image = UIImage(named: "HomeTabItem")
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = TarotViewController(viewModel: .init(coordinator: MainCoordinator(navigationController: UINavigationController()))) //then change this 
        let tarotNav = UINavigationController(rootViewController: secondVC)
        secondVC.coordinator = MainCoordinator(navigationController: tarotNav)
        secondVC.tabBarItem.title = "Tarot"
        secondVC.tabBarItem.image = UIImage(named: "tarotTabItem")
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [homeNav, tarotNav]
    }
}
