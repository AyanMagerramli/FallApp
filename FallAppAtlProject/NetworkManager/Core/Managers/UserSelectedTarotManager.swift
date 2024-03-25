//
//  UserSelectedTarotManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 25.03.24.
//

import Foundation

class UserSelectedTarotManager: UserSelectedTarotUseCase {
    func chooseTarotCard(completion: @escaping ((TarotSelectionSuccessModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: TarotSelectionSuccessModel.self,
                               endpoint: UserSelectedTarotCardEndpoint.selectedTarot.rawValue,
                               completion: completion)
    }
}
