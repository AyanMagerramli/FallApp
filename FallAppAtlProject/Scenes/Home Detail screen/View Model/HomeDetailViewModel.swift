//
//  HomeDetailViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

final class HomeDetailViewModel {
    
    var coordinator: MainCoordinator
    private let manager = HomeManager()
    var error: ((ErrorModel) -> Void)?
    var errorModel: ErrorModel?
    var success: (() -> Void)?
    var userPredictions: HomeSuccessModel?
    
    init (coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadUserZodiacSignPredictions() {
        manager.loadUserSignsPredictions { data, error in
            if let error {
                self.errorModel = error
                self.error?(error)
            } else if let data {
                self.userPredictions = data
                self.success?()
            }
        }
    }
}
