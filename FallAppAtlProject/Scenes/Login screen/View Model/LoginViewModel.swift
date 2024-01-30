//
//  LoginViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation

final class LoginViewModel {
    
    // MARK: There are two network calls in login button action:
    // 1. We send request into register API and check whether the user authorized ( "status": 409 ),
    //2.1 If user has already been authorized, then we wend request into Login API.
    //2.2 Or if user hasn't been authorized, then (s)he should register.
    
    private let manager = LoginManager()
    var response: LoginSuccessModel?
    var errorResponse: ErrorModel?
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    
    private let registerManager = RegisterManager()
    var registerResponse: RegisterOTPResponseModel?
    
    func loginUser(userData: LoginUserModel) {
        manager.registerUser(
            loginData: userData)
        {
            data, error in
            if let error
            {
                self.errorResponse = error
                self.error?(error)
            }
            else if let data
            {
                self.response = data
                print("LOGIN DATA is \(data)")
                self.success?()
            }
        }
    }
    
    func registerUser(userData: RegisterUserModel) {
        registerManager.registerUser(registerData: userData) { data, error in
            if let error {
                self.error?(error)
                self.errorResponse = error
            } else if let data {
                print(" Register DATA is \(data)")
                self.registerResponse = data
                self.success?()
            }
        }
    }
}
