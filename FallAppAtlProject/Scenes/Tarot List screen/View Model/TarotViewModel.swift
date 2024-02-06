//
//  TarotViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

final class TarotViewModel {
    
    private let manager = TarotListManager()
    var coordinator: MainCoordinator
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var errorModel: ErrorModel?
    var responseData: TarotDataModel?
    
    init (coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadTarotList () {
        manager.loadTarotList { data, error in
            if let error {
                self.error?(error)
                self.errorModel = error
            } else if let data {
                self.success?()
                self.responseData = data
            }
        }
    }
}
