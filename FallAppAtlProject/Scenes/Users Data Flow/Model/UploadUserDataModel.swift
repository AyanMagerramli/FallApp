//
//  GenderViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

struct UploadUserDataModel {
    
    var name: String?
    var surname: String?
    var city: String?
    var gender: String?
    var birthdate: String?
    
    var dictionary: [String: Any] {
        return [
            "name" : name ?? "",
            "surname" : surname ?? "",
            "city" : city ?? "",
            "gender" : gender ?? "",
            "birthdate" : birthdate ?? ""
        ]
    }
}
