//
//  RegisterManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation
import Alamofire

class RegisterManager: RegisterUseCase {
    func registerUser(registerData: RegisterUserModel, completion: @escaping ((RegisterResponseModel?, String?) -> Void)) {
        NetworkManager.request(
            model: RegisterResponseModel.self,
            endpoint: RegisterEndpoint.register.rawValue,
            parameters: registerData.dictionary,
            method: .post,
            encoding: JSONEncoding.default,
            completion: completion)
        print("USER IS \(registerData)")
    }
}
