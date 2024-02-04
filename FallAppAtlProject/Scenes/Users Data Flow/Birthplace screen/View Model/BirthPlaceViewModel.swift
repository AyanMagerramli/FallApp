//
//  BirthPlaceViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

final class BirthPlaceViewModel {
    
    private let countryManager = CountriesManager()
    private let cityManager = CityManager()
    var coordinator: MainCoordinator
    var errorResponse: ErrorModel?
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var countries: CountryModel?
    var cities: CityModel?
    var selectedCountry: String?
   // var builder = UserInfoBuilder()
    
    init (coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func downloadCountries() {
        countryManager.downloadCountryList { data, error in
            if let error {
                self.error?(error)
                self.errorResponse = error
            } else if let data {
                self.countries = data
                print("COUNTRIESSSSSSS \(String(describing: self.countries))")
                self.success?()
            }
        }
    }
    
    func downloadCities() {
        cityManager.downloadCitiesList { data, error in
            if let error {
                self.error?(error)
                self.errorResponse = error
            } else if let data {
                self.cities = data
                print("CITIESSSSSSS \(String(describing: self.cities))")
            }
        }
    }
    
    func countrySelection() {
        self.cityManager.countryName = self.selectedCountry
    }
}
