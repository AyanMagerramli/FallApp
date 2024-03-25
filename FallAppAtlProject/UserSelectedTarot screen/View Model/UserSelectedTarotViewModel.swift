//
//  UserSelectedTarotViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.03.24.
//

import Foundation

final class UserSelectedTarotViewModel {
    private let manager = UserSelectedTarotManager()
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    var selectedTarot: CardSelectionModel?
    
    func getSelectedTarotInfo() {
        manager.chooseTarotCard { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.selectedTarot = data.data
                self.success?()
            }
        }
    }
}
