//
//  SettingsViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

final class SettingsViewModel {
    
    var coordinator: MainCoordinator
    private let manager = LogoutManager()
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func logoutUser() {
        manager.logoutUser { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
            }
        }
    }
}
