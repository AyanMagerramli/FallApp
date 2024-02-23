//
//  ResetPasswordViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

final class ResetPasswordViewModel {
    
    var coordinator: MainCoordinator
    private let manager = ResetPasswordManager()
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var resultData: ResetPasswordSuccessModel?
    
    init (coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func resetPassword(body: ResetPasswordResponseModel) {
        manager.resetPassword(body: body) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.resultData = data
                self.success?()
            }
        }
    }
}
