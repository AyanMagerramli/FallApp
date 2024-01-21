//
//  UserInfoBuilder.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import Foundation

protocol UserInfoBuilderProtocol {
    var birthDate: String? {get set}
    var birthTime: String? {get set}
    var birthCountry: String? {get set}
    var birthCity: String? {get set}
    var name: String? {get set}
    var gender: String? {get set}
}


class UserInfoBuilder: UserInfoBuilderProtocol {
    var birthDate: String?
    var birthTime: String?
    var birthCountry: String?
    var birthCity: String?
    var name: String?
    var gender: String?
    
    func build() -> [String: Any] {
        guard let birthDate = birthDate,
              let birthTime = birthTime,
              let birthCountry = birthCountry,
              let birthCity =  birthCity,
              let name = name,
              let gender = gender
                
        else {return [:]}
        
        return ["birthDate": birthDate,
                "birthTime": birthTime,
                "birthCountry": birthCountry,
                "birthCity": birthCity,
                "name": name,
                "gender": gender]
    }
}
