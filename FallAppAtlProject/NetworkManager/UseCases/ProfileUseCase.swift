//
//  ProfileUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 10.02.24.
//

import Foundation

protocol ProfileUseCase {
    func getUserProfile(completion: @escaping(ProfileSuccessModel?, ErrorModel?) -> Void)
}
