//
//  TarotDetailViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

final class TarotDetailViewModel {
    
    var coordinator: MainCoordinator
    private let manager = TarotDetailManager()
    var error: ((ErrorModel?) -> Void)?
    var success: (() -> Void)?
    var tarotDetail: TarotDetailResponseModel?
    var tarotId: String
    
    init(coordinator: MainCoordinator, tarotId: String) {
        self.coordinator = coordinator
        self.tarotId = tarotId
    }
    
    func getTarotDetailedInfo () {
        manager.getTarotCardDetail(tarotId: self.tarotId) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.tarotDetail = data
                self.success?()
                print("DETAIL IS  \(self.tarotDetail)")
            }
        }
    }
}
