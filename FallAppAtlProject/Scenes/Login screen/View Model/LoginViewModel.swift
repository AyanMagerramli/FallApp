//
//  LoginViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit
import Foundation

final class LoginViewModel {
    
    // MARK: There are two network calls in login button action:
    // 1. We send request into register API and check whether the user authorized ( "status": 409 ),
    //2.1 If user has already been authorized, then we wend request into Login API.
    //2.2 Or if user hasn't been authorized, then (s)he should register.
        
    var response: LoginSuccessModel?
    var errorResponse: ErrorModel?
    var success: (() -> Void)?
    var registerSuccess: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    var coordinator: MainCoordinator
    
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
            } 
            
            else if let data {
                self.response = data
                guard let accessToken = data.data?.accessToken,
                      let refreshToken = data.data?.refreshToken else { return }
                // Store new tokens in Keychain upon successful login
                self.storeTokensInKeychain(accessToken: accessToken, refreshToken: refreshToken)
                print("LOGIN DATA is \(data)")
                if data.data?.hasData == false {
                    self.coordinator.navigate(to: .birthDate)
                } 
                
                else {
                    self.coordinator.start()
                    self.didUserLogin()
                }
                self.success?()
            }
        }
    }
    
    private func didUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "loggedIn")
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
                self.registerSuccess?()
            }
        }
    }
    
    // Function to store tokens in Keychain
     func storeTokensInKeychain(accessToken: String, refreshToken: String) {
        KeychainManager.shared.setValue(value: accessToken, for: KeychainValues.accessToken.rawValue)
        KeychainManager.shared.setValue(value: refreshToken, for: KeychainValues.refreshToken.rawValue)
    }
    
    // Function to clear tokens from Keychain (on logout)
     func clearTokensFromKeychain() {
         KeychainManager.shared.deleteValue(key: KeychainValues.accessToken.rawValue)
         KeychainManager.shared.deleteValue(key: KeychainValues.refreshToken.rawValue)
    }
}
