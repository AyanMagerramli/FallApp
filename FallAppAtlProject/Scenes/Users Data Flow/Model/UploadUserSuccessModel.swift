//
//  UploadUserSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

// MARK: - UploadUserModel
struct UploadUserSuccessModel: Codable {
    let data: DataClassForUpload?
    let message: String?
}

// MARK: - DataClass
struct DataClassForUpload: Codable {
    let name, birthDate, zodiacSign, animalYear: String?
    let ascendantSign: String?
}

