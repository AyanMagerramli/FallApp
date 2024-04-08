//
//  ConfirmOTPViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

final class ConfirmOTPViewModel {
    
    var coordinator: MainCoordinator
    private let manager = OTPForPasswordManager()
    private let verifyOTPManager = VerifyOTPManager()
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var errorModel: ErrorModel?
    var sendOTPData: SendOTPSuccessModel?
    var body = SendOTPResponseModel(mail: UserdefaultsManager.shared.getValue(for: "email"))
    var otpVerifyBody: VerifyOTPResponseModel?
    var verifyOTPData: VerifyOTPSuccessModel?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func sendOTP() {
        manager.sendOTP(body: body) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.sendOTPData = data
                self.success?()
            }
        }
    }
    
    func verifyOTP(body: VerifyOTPResponseModel) {
        verifyOTPManager.verifyOTP(body: body) { data, error in
            if let error {
                self.errorModel = error
                self.error?(error)
            } else if let data {
                self.verifyOTPData = data
                self.success?()
            }
        }
    }
}
