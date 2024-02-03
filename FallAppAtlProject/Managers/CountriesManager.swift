//
//  CountriesManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

class CountriesManager: CountriesUseCase {
    func downloadCountryList(completion: @escaping ((CountryModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: CountryModel.self,
                               endpoint: CountryEndpoint.country.rawValue,
                               completion: completion)
    }
}
