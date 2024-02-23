//
//  ResetPasswordManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation
import Alamofire

class ResetPasswordManager: ResetPasswordUseCase {
    func resetPassword(body: ResetPasswordResponseModel,
                       completion: @escaping ((ResetPasswordSuccessModel?, ErrorModel?) -> Void)) {
        
        NetworkManager.request(model: ResetPasswordSuccessModel.self,
                               endpoint: ResetPasswordEndpoint.chnagePassword.rawValue,
                               parameters: body.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}
