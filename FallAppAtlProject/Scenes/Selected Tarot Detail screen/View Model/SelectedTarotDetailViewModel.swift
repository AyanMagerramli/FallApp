//
//  SelectedTarotDetailViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.02.24.
//

import Foundation

final class SelectedTarotDetailViewModel {
    var coordinator: MainCoordinator
    var tarotId: String
    
    init(coordinator: MainCoordinator, id: String) {
        self.coordinator = coordinator
        self.tarotId = id
    }
    
    private let tarotSelectionManager = TarotSelectionManager()
    var selectedTarot: TarotCardDetailModel?
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    
    func selectTarotCard(body: TarotSelectionRequestModel) {
        tarotSelectionManager.chooseTarotCard(body: body) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.selectedTarot = data.data?.card
                self.success?()
            }
        }
    }
}
