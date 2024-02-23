//
//  UserDefaultsExtension.swift
//  FallAppAtlProject
//
//  Created by Ayan on 24.02.24.
//

import Foundation

extension UserDefaults {
    
    // Define a computed property to observe changes to the "loggedIn" key
    
    @objc dynamic var loggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "loggedIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "loggedIn")
        }
    }
}
