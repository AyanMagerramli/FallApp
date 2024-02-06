//
//  TarotDetailManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 07.02.24.
//

import Foundation

class TarotDetailManager: TarotDetailUseCase {
    func getTarotCardDetail(tarotId: String, completion: @escaping ((TarotDetailResponseModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: TarotDetailResponseModel.self,
                               endpoint: TarotDetailEndpoint.tarotDetail.rawValue + tarotId,
                               completion: completion)
    }
}
