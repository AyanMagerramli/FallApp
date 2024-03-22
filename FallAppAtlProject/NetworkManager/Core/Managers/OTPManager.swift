//
//  OTPManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 29.01.24.
//

import Foundation
import Alamofire

class OTPManager: OTPUseCase {
    func resetOTP(otpData: OTPResetModel, completion: @escaping ((OTPResetSuccessResponseModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: OTPResetSuccessResponseModel.self,
                               endpoint: RegisterEndpoint.resetOTP.rawValue,
                               parameters: otpData.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
    
    func confirmOTP(otpData: OTPResponseModel, completion: @escaping ( (RegisterOTPResponseModel?, ErrorModel?) -> Void) ) {
        NetworkManager.request(model: RegisterOTPResponseModel.self,
                               endpoint: RegisterEndpoint.confirmation.rawValue,
                               parameters: otpData.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}
