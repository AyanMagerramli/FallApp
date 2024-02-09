//
//  ProfileViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 10.02.24.
//

import Foundation

final class ProfileViewModel {
    private let manager = ProfileManager()
    var success: (() -> Void)?
    var profileModel: ProfileSuccessModel?
    var error: ((ErrorModel) -> Void)?
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func getUserProfile() {
        manager.getUserProfile { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
                self.profileModel = data
            }
        }
    }
}
