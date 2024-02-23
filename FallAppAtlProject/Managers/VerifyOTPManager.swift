//
//  VerifyOTPManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation
import Alamofire

class VerifyOTPManager: VerifyOTPUseCase {
    func verifyOTP(body: VerifyOTPResponseModel,
                   completion: @escaping ((VerifyOTPSuccessModel?, ErrorModel?) -> Void)) {
        
        NetworkManager.request(model: VerifyOTPSuccessModel.self,
                               endpoint: VerifyOTPEndpoint.veriflyOTP.rawValue,
                               parameters: body.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}
