//
//  SettingsViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation
import UIKit

struct Sections {
    let title: String
    let options: [SettingsOptions]
}

enum SettingsColor {
    case systemGreen
    case systemBlue
    case systemCyan
    case systemRed
    
    var color: UIColor {
        switch self {
        case .systemBlue:
            UIColor.systemBlue
        case .systemGreen:
            UIColor.systemGreen
        case .systemCyan:
            UIColor.systemCyan
        case .systemRed:
            UIColor.systemRed
        }
    }
}

enum SettingsIconImage {
    case abousUs
    case termsAndConditions
    case reset
    case logout
    
    var icon: UIImage {
        switch self {
        case .abousUs:
            UIImage(systemName: "info.circle") ?? UIImage()
        case .termsAndConditions:
            UIImage(systemName: "book") ?? UIImage()
        case .reset:
            UIImage(systemName: "lock") ?? UIImage()
        case .logout:
            UIImage(systemName: "power") ?? UIImage()
        }
    }
}

struct SettingsOptions {
    let title: String
    let icon: SettingsIconImage
    let iconBackgroundColor: SettingsColor
    let handler: (() -> Void)
}

final class SettingsViewModel {
    
    var coordinator: MainCoordinator?
    private let manager = LogoutManager()
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    var model = [Sections]()
    
//    init(coordinator: MainCoordinator) {
//        self.coordinator = coordinator
//    }
    
    func logoutUser() {
        manager.logoutUser { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
            }
        }
    }
    
    func setupSettingsOptions() {
        self.model.append(Sections(title: "Information",
                                   options:
                                    [
                                        SettingsOptions(title: "About us",
                                                        icon: .abousUs,
                                                        iconBackgroundColor: .systemGreen,
                                                        handler: {
                                                            self.coordinator?.goToAboutUsScreen()
                                                        }),
                                        
                                        SettingsOptions(title: "Terms and Conditions",
                                                        icon: .termsAndConditions,
                                                        iconBackgroundColor: .systemBlue,
                                                        handler: {
                                                            self.coordinator?.goToTermsAndConditionsScreen()
                                                        })]))
        
        self.model.append(Sections(title: "General",
                                   options:
                                    [
                                        SettingsOptions(title: "Reset password",
                                                        icon: .reset,
                                                        iconBackgroundColor: .systemCyan,
                                                        handler: {
                                                            self.coordinator?.goToConfirmOTPScreen()
                                                        }),
                                        
                                        SettingsOptions(title: "Logout",
                                                        icon: .logout,
                                                        iconBackgroundColor: .systemRed,
                                                        handler: {
                                                            self.logoutUser()
                                                        })]))
    }
}
