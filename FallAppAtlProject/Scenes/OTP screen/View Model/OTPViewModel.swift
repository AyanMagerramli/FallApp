//
//  OTPViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.01.24.
//

import Foundation

class OTPViewModel {
    
   private let manager = OTPManager()
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var errorResponse: ErrorModel?
    var successResponse: RegisterOTPResponseModel?
    var resetOTPSuccessResponse: OTPResetSuccessResponseModel?
    
    func confirmOTP (otpData: OTPResponseModel) {
        manager.confirmOTP(otpData: otpData) { data, error in
            if let error {
                self.errorResponse = error
                self.error?(error)
            } else if let data {
                self.successResponse = data
                self.success?()
            }
        }
    }
    
    func resetOTP (otpData: OTPResetModel) {
        manager.resetOTP(otpData: otpData) { data, error in
            if let error {
                self.errorResponse = error
                self.error?(error)
            } else if let data {
                self.resetOTPSuccessResponse = data
                self.success?()
            }
        }
    }
}

