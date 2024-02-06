//
//  TarotListManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

class TarotListManager: TarotListUseCase {
    func loadTarotList(completion: @escaping ((TarotDataModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: TarotDataModel.self,
                               endpoint: TarotEndpoint.tarotList.rawValue,
                               completion: completion)
    }
}
