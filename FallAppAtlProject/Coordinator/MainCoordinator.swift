//
//  MainCoordinator.swift
//  FallAppAtlProject
//
//  Created by Ayan on 14.01.24.
//

import Foundation
import UIKit

enum NavigationDestination {
    case otp
    case birthDate
    case birthCity
    case name
    case gender
    case zodiacInfo
    
    func navigate (from coordinator: MainCoordinator) {
        switch self {
        case .otp:
            coordinator.goToOtpScreen()
        case .birthDate:
            coordinator.goToBirthDateScreen()
        case .birthCity:
            coordinator.goToBirthCityScreen()
        case .name:
            coordinator.goToNameScreen()
        case .gender:
            coordinator.goToGenderScreen()
        case .zodiacInfo:
            coordinator.goToZodiacInfoSignScreen()
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
    //
    //        func goToRegisterScreen() {
    //            let vc = RegisterViewController()
    //            vc.coordinator = self
    //            navigationController.show(vc, sender: nil)
    //        }
    
    func goToOtpScreen() {
        let vc = OTPViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToBirthDateScreen() {
        let vc = BirthdayViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToBirthCityScreen() {
        let vc = BirthPlaceViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToNameScreen() {
        let vc = NameViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToGenderScreen() {
        let vc = GenderViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToZodiacInfoSignScreen() {
        let vc = ZodiacSignInfoController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToTarotDetail(tarotId: String) {
        let vc = TarotDetailViewController(viewModel: .init(coordinator: self, tarotId: tarotId))
        navigationController.show(vc, sender: nil)
    }
    
    func goToHomeScreen() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToHomeDetailScreen(tag: Int) {
        let vc = HomeDetailController(viewModel: .init(coordinator: self))
        vc.tag = tag
        navigationController.show(vc, sender: nil)
    }
    
    func goToTarotListScreen() { //this is temperary, pls then delete <3
        let vc = TarotViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
}

