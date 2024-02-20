//
//  KeychainManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.02.24.
//

import Foundation
import KeychainSwift

// NOTE: Implementation of keychain manager in order to import KeychainSwift only once and control all keychain operations from centeralized place

class KeychainManager {
    
    static let shared = KeychainManager()
    let keychain = KeychainSwift()
    
    // MARK: - Keychain operations
    
    func setValue (value: String, for key: String) {
        keychain.set(value, forKey: key)
    }
    
    func getValue (key: String) -> String? {
       return keychain.get(key)
    }
    
    func deleteValue (key: String) {
        keychain.delete(key)
    }
}
