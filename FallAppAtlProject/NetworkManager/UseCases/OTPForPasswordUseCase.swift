//
//  OTPForPasswordUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

protocol OTPForPasswordUseCase {
    func sendOTP (body: SendOTPResponseModel,
                  completion: @escaping(SendOTPSuccessModel?, ErrorModel?) -> Void)
}
