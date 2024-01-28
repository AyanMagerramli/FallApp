//
//  RegisterViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation

class RegisterViewModel {
    
    var response: RegisterResponseModel?
    var errorResponse: ErrorModel?
    private let manager = RegisterManager()
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    
    func registerUser(userData: RegisterUserModel) {
        manager.registerUser(registerData: userData) { data, error in
            if let error {
                self.error?(error)
                self.errorResponse = error
            } else if let data {
                print("DATA is \(data)")
                self.response = data
                self.success?()
            }
        }
    }
}
