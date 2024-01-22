//
//  MainCoordinator.swift
//  FallAppAtlProject
//
//  Created by Ayan on 14.01.24.
//

import Foundation
import UIKit

enum navigationAction {
    
}

class MainCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var window: UIWindow?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let tabBarController = TabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

//
//class MainCoordinator: Coordinator {
//    
//    var childCoordinators = [Coordinator]()
//    var navigationController: UINavigationController
//    var window: UIWindow?
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    func start() {
//        setupTabBarController()
//    }
//    
//    private func setupTabBarController() {
//        let tabBarController = TabBarController()
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
//    }
//    
//    func goToSearch() {
//        let vc = SearchViewController()
//        vc.coordinator = self
//        navigationController.show(vc, sender: nil)
//        //NOTE: pushViewController is depreciated
//    }
//    
//    func goToMovieDetail(id: Int) {
//        let viewModel = MovieDetailViewModel(movieID: id)
//        let vc = MovieDetailViewController(viewModel: viewModel)
//        vc.coordinator = self
//        //hides tab bar
//        vc.hidesBottomBarWhenPushed = true
//        navigationController.show(vc, sender: self)
//    }
//    
//    func goToCategory () {
//        let vc = CategoryViewController()
//        vc.coordinator = self
//        navigationController.show(vc, sender: self)
//    }
//    
//    func goToPeopleMovieList(id: Int) {
//        let viewModel = PeopleMovieListViewModel(personID: id)
//        let vc = PeopleMovieListController(viewModel: viewModel)
//        vc.coordinator = self
//        navigationController.show(vc, sender: nil)
//    }
//    
//    func goToPeople() {
//        let vc = PeopleViewController()
//        vc.coordinator = self
//        navigationController.show(vc, sender: nil)
//    }
//}

