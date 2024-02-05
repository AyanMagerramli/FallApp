//
//  HomeManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 05.02.24.
//

import Foundation

class HomeManager: HomeUseCase {
    func loadUserSignsPredictions(completion: @escaping ((HomeSuccessModel?, ErrorModel?) -> Void)) {NetworkManager.request(model: HomeSuccessModel.self,
                               endpoint: HomeEndpoint.home.rawValue,
                               completion: completion)
    }
}
