//
//  ProfileManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 10.02.24.
//

import Foundation

class ProfileManager: ProfileUseCase {
    func getUserProfile(completion: @escaping (ProfileSuccessModel?, ErrorModel?) -> Void) {
        NetworkManager.request(model: ProfileSuccessModel.self,
                               endpoint: ProfileEndpoint.profile.rawValue,
                               completion: completion)
    }
}
