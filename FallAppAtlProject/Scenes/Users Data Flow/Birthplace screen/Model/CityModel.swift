//
//  CityModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

struct CityModel: Codable {
    let data: [City]?
    let message: String?
}

struct City: Codable {
    let id: String?
    let cityName: String?
    let lat: String?
    let lng: String?
    let country: String?
}
