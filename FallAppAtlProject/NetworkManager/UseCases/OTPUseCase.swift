//
//  OTPUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 29.01.24.
//

import Foundation

protocol OTPUseCase {
    func confirmOTP (
        otpData: OTPResponseModel,
        completion: @escaping((RegisterOTPResponseModel?, ErrorModel?) -> Void)
    )
    
    func resetOTP (
        otpData: OTPResetModel,
        completion: @escaping((OTPResetSuccessResponseModel?, ErrorModel?) -> Void)
    )
}
