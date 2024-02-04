//
//  LoginViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation
import KeychainSwift

final class LoginViewModel {
    
    // MARK: There are two network calls in login button action:
    // 1. We send request into register API and check whether the user authorized ( "status": 409 ),
    //2.1 If user has already been authorized, then we wend request into Login API.
    //2.2 Or if user hasn't been authorized, then (s)he should register.
        
    var response: LoginSuccessModel?
    var errorResponse: ErrorModel?
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    var coordinator: MainCoordinator
    let keychain = KeychainSwift()
    
    init (coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    private let loginManager = LoginManager()
    private let registerManager = RegisterManager()
    var registerResponse: RegisterOTPResponseModel?
    
    func loginUser(userData: LoginUserModel) {
        loginManager.registerUser(loginData: userData) { data, error in
            if let error {
                self.errorResponse = error
                self.error?(error)
            } else if let data {
                self.response = data
                guard let accessToken = data.data?.accessToken,
                      let refreshToken = data.data?.refreshToken else { return }
                // Store new tokens in Keychain upon successful login
                self.storeTokensInKeychain(accessToken: accessToken, refreshToken: refreshToken)
                print("LOGIN DATA is \(data)")
                if data.data?.hasData == false {
                    self.coordinator.navigate(to: .birtDate)
                } else {
                    self.coordinator.start()
                }
                self.success?()
            }
        }
    }
    
    func registerUser(userData: RegisterUserModel) {
        registerManager.registerUser(registerData: userData) { data, error in
            if let error {
                if error.status == 409 {
                    // Handle registration conflict error
                    self.loginUser(userData: .init(email: userData.email, password: userData.password))
                } else {
                    self.error?(error)
                    self.errorResponse = error
                }
            } else if let data {
                print(" Register DATA is \(data)")
                self.registerResponse = data
                self.success?()
                UserDefaults.standard.setValue(data.data?.message, forKey: "otp")
                self.coordinator.navigate(to: .otp)
            }
        }
    }
    
    // Function to store tokens in Keychain
    private func storeTokensInKeychain(accessToken: String, refreshToken: String) {
        keychain.set(accessToken, forKey: "accessToken")
        keychain.set(refreshToken, forKey: "refreshToken")
    }
    
    // Function to clear tokens from Keychain (on logout)
     func clearTokensFromKeychain() {
        keychain.delete("accessToken")
        keychain.delete("refreshToken")
    }
}
