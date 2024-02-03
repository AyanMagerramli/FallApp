//
//  CountryModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

// MARK: - CountryModel
struct CountryModel: Codable {
    let data: [Datum]?
    let message: String?
}

// MARK: - Datum
struct Datum: Codable {
    let id, countryName: String?
}
