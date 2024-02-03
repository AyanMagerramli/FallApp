//
//  CountriesUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

protocol CountriesUseCase {
    func downloadCountryList(completion: @escaping((CountryModel?, ErrorModel?)->Void))
}
