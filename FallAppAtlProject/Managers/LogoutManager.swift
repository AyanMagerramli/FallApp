//
//  LogoutManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

class LogoutManager: LogoutUseCase {
    func logoutUser(completion: @escaping((LogoutSuccessModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: LogoutSuccessModel.self,
                               endpoint: LogoutEndpoint.logout.rawValue,
                               method: .delete,
                               completion: completion)
    }
}
