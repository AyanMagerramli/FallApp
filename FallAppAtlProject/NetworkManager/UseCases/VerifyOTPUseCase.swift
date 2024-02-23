//
//  VerifyOTPUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

protocol VerifyOTPUseCase {
    func verifyOTP (body: VerifyOTPResponseModel,
                    completion: @escaping((VerifyOTPSuccessModel?, ErrorModel?) -> Void))
}
