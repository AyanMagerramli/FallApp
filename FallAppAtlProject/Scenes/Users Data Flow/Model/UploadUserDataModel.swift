//
//  GenderViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

struct UploadUserDataModel: Codable {
    
    var name: String?
    var city: String?
    var gender: String?
    var birthDate: String?
    
    var dictionary: [String: Any] {
        return [
            "name" : name ?? "",
            "city" : city ?? "",
            "gender" : gender ?? "",
            "birthDate" : birthDate ?? ""
        ]
    }
}
