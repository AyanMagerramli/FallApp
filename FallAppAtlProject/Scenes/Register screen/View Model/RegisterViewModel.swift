//
//  RegisterViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation

class RegisterViewModel {
    
    var response: RegisterResponseModel?
    private let manager = RegisterManager()
    var error: ((String) -> Void)?
    var success: (() -> Void)?
    
    func registerUser(userData: RegisterUserModel) {
        manager.registerUser(registerData: userData) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                print("DATA is \(data)")
                self.response = data
                self.success?()
            }
        }
    }
}
