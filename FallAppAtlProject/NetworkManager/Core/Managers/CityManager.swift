//
//  CityManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

class CityManager: CitiesUseCase {
    var countryName: String?
    
    func downloadCitiesList(completion: @escaping ((CityModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: CityModel.self,
                               endpoint: CityEndpoint.city.rawValue+(countryName ?? "")+"/cities",
                               completion: completion)
    }
}
