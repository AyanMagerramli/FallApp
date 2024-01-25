//
//  MainCoordinator.swift
//  FallAppAtlProject
//
//  Created by Ayan on 14.01.24.
//

import Foundation
import UIKit

enum NavigationDestination {
    case login
    case register
    case otp
    case birtDate
    case birthCity
    case name
    case gender
    case tarotDetail
    
    func navigate (from coordinator: MainCoordinator) {
        switch self {
            
        case .login:
            coordinator.goToLoginScreen()
        case .register:
            coordinator.goToRegisterScreen()
        case .otp:
            coordinator.goToOtpScreen()
        case .birtDate:
            coordinator.goToBirthDateScreen()
        case .birthCity:
            coordinator.goToBirthCityScreen()
        case .name:
            coordinator.goToNameScreen()
        case .gender:
            coordinator.goToGenderScreen()
        case .tarotDetail:
            coordinator.goToTarotDetail()
        }
    }
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
    
    func navigate(to destination: NavigationDestination) {
           destination.navigate(from: self)
       }
    
    func goToLoginScreen() {
        let vc = LoginViewController()
        window?.rootViewController = navigationController
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToRegisterScreen() {
        let vc = RegisterViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToOtpScreen() {
        let vc = OTPViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToBirthDateScreen() {
        let vc = ParentViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToBirthCityScreen() {
        let vc = BirthCityViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToNameScreen() {
        let vc = NameViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToGenderScreen() {
        let vc = GenderViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToTarotDetail() {
        let vc = TarotDetailViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
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

