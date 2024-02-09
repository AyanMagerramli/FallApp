//
//  ProfileSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 10.02.24.
//

import Foundation


// MARK: - ProfileSuccessModel
struct ProfileSuccessModel: Codable {
    let data: GeneralProfile?
    let message: String?
}

// MARK: - DataClass
struct GeneralProfile: Codable {
    let profile: Profile?
    let generalInfo: GeneralInfo?
}

// MARK: - GeneralInfo
struct GeneralInfo: Codable {
    let title: String?
    let items: [Items]?
}

// MARK: - Item
struct Items: Codable {
    let image: String?
    let text: String?
    let sortingRank: Int?
}

// MARK: - Profile
struct Profile: Codable {
    let avatar: String?
    let title, zodiacSign, animalYear, ascendingSign: String?
    let birthDate, birthTime: String?
}
