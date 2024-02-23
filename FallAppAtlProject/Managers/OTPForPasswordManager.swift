//
//  OTPForPasswordManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation
import Alamofire

class OTPForPasswordManager: OTPForPasswordUseCase {
    func sendOTP(body: SendOTPResponseModel,
                 completion: @escaping (SendOTPSuccessModel?, ErrorModel?) -> Void) {
        
        NetworkManager.request(model: SendOTPSuccessModel.self,
                               endpoint: SendOTPForPasswordEndpoint.sendOTP.rawValue,
                               parameters: body.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}
