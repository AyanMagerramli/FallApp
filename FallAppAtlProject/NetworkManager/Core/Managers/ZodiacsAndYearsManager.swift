//
//  ZodiacsAndYearsManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 08.02.24.
//

import Foundation

class ZodiacsAndYearsManager: ZodiacsAndYearsUseCase {
    func getZodiacsAndYearsList(completion: @escaping (ZodiacsAndYearsResponseModel?, ErrorModel?) -> Void) {
        NetworkManager.request(model: ZodiacsAndYearsResponseModel.self,
                               endpoint: ZodiacsAndYearsListEndpoint.zodiacsAndYearsList.rawValue,
                               completion: completion)
    }
}
