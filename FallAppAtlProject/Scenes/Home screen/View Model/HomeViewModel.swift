//
//  HomeViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 05.02.24.
//

import Foundation

final class HomeViewModel {
    
    private let manager = HomeManager();
    private let tarotManager = UserSelectedTarotManager()
    var coordinator: MainCoordinator?
    var error: ((ErrorModel) -> Void)?
    var errorModel: ErrorModel?
    var success: (() -> Void)?
    var tarotSuccess: (() -> Void)?
    var userPredictions: HomeSuccessModel?
    var alreadySelected: Bool?
    
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
    
    func didUserChooseTarot() {
        tarotManager.chooseTarotCard { data, error in
            if let error {
                self.errorModel = error
                self.error?(error)
            } else if let data {
                self.alreadySelected = data.data?.alreadySelected
                self.tarotSuccess?()
            }
        }
    }
}
