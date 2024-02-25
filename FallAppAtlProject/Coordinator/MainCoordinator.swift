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
    case profile
    case matchingList
    
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
        case .profile:
            coordinator.goToProfileScreen()
        case .matchingList:
            coordinator.goToMatchingListScreen()
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
    
    func goToHomeDetailScreen(tag: Int) {
        let vc = HomeDetailController(viewModel: .init(coordinator: self))
        vc.tag = tag
        navigationController.show(vc, sender: nil)
    }
    
    func goToZodiacAndYearDetailScreen(id: String, type: String) {
        let vc = YearSignDetailViewController(viewModel: .init(coordinator: self, id: id, type: type))
        navigationController.show(vc, sender: nil)
    }
    
    func goToProfileScreen() {
        let vc = ProfileViewController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToMatchingListScreen() {
        let vc = ZodiacSignsMatchingListController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToMatchingResultScreen(body: MatchingResultBodyModel) {
        let vc = MatchingResultController(viewModel: .init(coordinator: self, body: body))
        navigationController.show(vc, sender: nil)
    }
    
    func goToNewsDetailScreen(selectedItem: News) {
        let vc = NewsDetailController(newsDetailViewModel: .init(coordinator: self, selectedItem: selectedItem))
        navigationController.show(vc, sender: nil)
    }
    
//    func goToSettingsScreen() {
//        let vc = SettingsController(viewModel: .init(coordinator: self))
//        vc.hidesBottomBarWhenPushed = true
//        navigationController.show(vc, sender: nil)
//    }
    
    func goToConfirmOTPScreen() {
        let vc = ConfirmOTPController(viewModel: .init(coordinator: self))
        navigationController.show(vc, sender: nil)
    }
    
    func goToResetPasswordScreen(code: String) {
        let vc = ResetPasswordController(viewModel: .init(coordinator: self), code: code)
        navigationController.show(vc, sender: nil)
    }
    
    func goToSuccessScreen() {
        let vc = SuccessController(viewModel: .init(coordinator: self))
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: true)
    }
    
    func goToAboutUsScreen() {
        let vc = AboutUsController()
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: true)
    }
    
    func goToTermsAndConditionsScreen() {
        let vc = TermsAndConditionsController()
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: true)
    }
}

