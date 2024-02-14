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
        self.tabBar.tintColor = .main
        UITabBar.appearance().barTintColor = .main
        let firstVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: firstVC)
        firstVC.viewModel.coordinator = MainCoordinator(navigationController: homeNav)
        firstVC.tabBarItem.title = "Home"
        let homeImage = UIImage(named: "HomeTabItem")?.withRenderingMode(.alwaysTemplate)
        firstVC.tabBarItem.image = homeImage
        firstVC.tabBarItem.selectedImage = homeImage
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = TarotViewController()
        let tarotNav = UINavigationController(rootViewController: secondVC)
        secondVC.viewModel.coordinator = MainCoordinator(navigationController: tarotNav)
        secondVC.tabBarItem.title = "Tarot"
        // Set the image with the rendering mode
        let tarotImage = UIImage(named: "tabBarItem2")?.withRenderingMode(.alwaysTemplate)
        secondVC.tabBarItem.image = tarotImage
        secondVC.tabBarItem.selectedImage = tarotImage
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let thirdVC = ZodiacsAndYearsController()
        let yearAndSignsNav = UINavigationController(rootViewController: thirdVC)
        thirdVC.viewModel.coordinator = MainCoordinator(navigationController: yearAndSignsNav)
        thirdVC.tabBarItem.title = "Zodiacs"
        let tabImage = UIImage(named: "tarotTabItem")?.withRenderingMode(.alwaysTemplate)
        thirdVC.tabBarItem.image = tabImage
        thirdVC.tabBarItem.selectedImage = tabImage
        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)

        viewControllers = [homeNav, tarotNav, yearAndSignsNav]
    }
}
