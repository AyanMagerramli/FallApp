//
//  UserdefaultsManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.02.24.
//

import Foundation

// NOTE: Implementation of User Defaults manager in order to control all UserDefaults operations from centeralized place

class UserdefaultsManager {
    static let shared = UserdefaultsManager()
    
    // MARK: - UserDefaults operations
    
    func setValue<T>(value: T, for key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func getValue<T>(for key: String) -> T? {
        return UserDefaults.standard.value(forKey: key) as? T
    }
    
    func deleteValue (for key: String) {
        UserDefaults.standard.setValue("", forKey: key)
    }
}
