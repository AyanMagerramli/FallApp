//
//  TabBarController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 14.01.24.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        // MARK: - Home Tab
        
        let firstVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: firstVC)
        firstVC.viewModel.coordinator = MainCoordinator(navigationController: homeNav)
        let homeTabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(systemName: "house.fill"),
                                          selectedImage: nil)
        firstVC.tabBarItem = homeTabBarItem
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        // MARK: - Tarots Tab
        
        let secondVC = TarotViewController()
        let tarotNav = UINavigationController(rootViewController: secondVC)
        secondVC.viewModel.coordinator = MainCoordinator(navigationController: tarotNav)
        let tarotTabBarItem = UITabBarItem(title: "Tarot",
                                           image: UIImage(systemName: "suit.spade.fill"),
                                          selectedImage: nil)
        secondVC.tabBarItem = tarotTabBarItem
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        // MARK: - Zodiacs and Years Tab
        
        let thirdVC = ZodiacsAndYearsController()
        let yearAndSignsNav = UINavigationController(rootViewController: thirdVC)
        thirdVC.viewModel.coordinator = MainCoordinator(navigationController: yearAndSignsNav)
        let zodiacAndYearsTabBarItem = UITabBarItem(title: "Zodiacs",
                                                    image: UIImage(systemName: "star.circle.fill"),
                                                    selectedImage: nil)
        thirdVC.tabBarItem = zodiacAndYearsTabBarItem
        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        // MARK: - News Tab
        
        let fourthVC = NewsController()
        let newsNav = UINavigationController(rootViewController: fourthVC)
        fourthVC.viewModel.coordinator = MainCoordinator(navigationController: newsNav)
        let newsTabBarItem = UITabBarItem(title: "News",
                                          image: UIImage(systemName: "newspaper"),
                                          selectedImage: nil)
        fourthVC.tabBarItem = newsTabBarItem
        fourthVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        // MARK: - Settings Tab
        
        let fifthVC = SettingsController()
        let settingsNav = UINavigationController(rootViewController: fifthVC)
        fifthVC.viewModel.coordinator = MainCoordinator(navigationController: settingsNav)
        let settingsTabBarItem = UITabBarItem(title: "Settings",
                                              image: UIImage(systemName: "gear"),
                                              selectedImage: nil)
        fifthVC.tabBarItem = settingsTabBarItem
        fifthVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        viewControllers = [homeNav, newsNav, tarotNav, yearAndSignsNav, settingsNav]
        
        tabBar.tintColor = .main
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = .black.withAlphaComponent(0.65)
    }
}
