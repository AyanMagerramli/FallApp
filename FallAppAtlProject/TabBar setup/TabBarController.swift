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
        let homeTabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(named: "HomeTabItem"),
                                          selectedImage: nil)
        firstVC.tabBarItem = homeTabBarItem
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = TarotViewController()
        let tarotNav = UINavigationController(rootViewController: secondVC)
        secondVC.viewModel.coordinator = MainCoordinator(navigationController: tarotNav)
        let tarotTabBarItem = UITabBarItem(title: "Tarot",
                                          image: UIImage(named: "tabBarItem2"),
                                          selectedImage: nil)
        secondVC.tabBarItem = tarotTabBarItem
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let thirdVC = ZodiacsAndYearsController()
        let yearAndSignsNav = UINavigationController(rootViewController: thirdVC)
        thirdVC.viewModel.coordinator = MainCoordinator(navigationController: yearAndSignsNav)
        let zodiacAndYearsTabBarItem = UITabBarItem(title: "Zodiacs",
                                                    image: UIImage(named: "tarotTabItem"),
                                                    selectedImage: nil)
        thirdVC.tabBarItem = zodiacAndYearsTabBarItem
        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let fourthVC = NewsController()
        let newsNav = UINavigationController(rootViewController: fourthVC)
        fourthVC.viewModel.coordinator = MainCoordinator(navigationController: newsNav)
        let newsTabBarItem = UITabBarItem(title: "News",
                                          image: UIImage(systemName: "newspaper"),
                                          selectedImage: nil)
        fourthVC.tabBarItem = newsTabBarItem
        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        viewControllers = [homeNav, newsNav, tarotNav, yearAndSignsNav]
    }
}
