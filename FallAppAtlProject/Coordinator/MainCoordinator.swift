//
//  MainCoordinator.swift
//  FallAppAtlProject
//
//  Created by Ayan on 14.01.24.
//

import Foundation
import UIKit

enum NavigationDestination {
    case register
    case otp
    case birtDate
    case birthCity
    case name
    case gender
    case zodiacInfo
    case tarotDetail
    
    func navigate (from coordinator: MainCoordinator) {
        switch self {            
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
        case .zodiacInfo:
            coordinator.goToZodiacInfoSignScreen()
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
        let vc = BirthdayViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToBirthCityScreen() {
        let vc = BirthCityViewController(viewModel: .init(coordinator: self))
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
    
    func goToTarotDetail() {
        let vc = TarotDetailViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
    
    func goToHomeScreen() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.show(vc, sender: nil)
    }
}

