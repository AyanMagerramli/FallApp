//
//  CitiesUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

protocol CitiesUseCase {
    func downloadCitiesList(completion: @escaping((CityModel?, ErrorModel?)->Void))
}
