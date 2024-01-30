//
//  LoginManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 30.01.24.
//

import Foundation
import Alamofire

class LoginManager: LoginUseCase {
    func registerUser(loginData: LoginUserModel, completion: @escaping ((LoginSuccessModel?, ErrorModel?) -> Void)) {
        NetworkManager.request( model: LoginSuccessModel.self,
                                endpoint: LoginEndpoint.login.rawValue,
                                parameters: loginData.dictionary,
                                method: .post,
                                encoding: JSONEncoding.default,
                                completion: completion)
    }
}
