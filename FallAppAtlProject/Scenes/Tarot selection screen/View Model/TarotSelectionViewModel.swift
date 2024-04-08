//
//  TarotSelectionViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.02.24.
//

import Foundation

final class TarotSelectionViewModel {
    var coordinator: MainCoordinator
    private let tarotListManager = TarotListManager()
    var tarotList: TarotDataModel?
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    var didUserSelectTarot: Bool?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func getAllTarots() {
        tarotListManager.loadTarotList { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.tarotList = data
                self.didUserSelectTarot = false
                self.success?()
            }
        }
    }
}
