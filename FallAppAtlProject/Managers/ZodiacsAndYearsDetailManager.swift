//
//  ZodiacsAndYearsDetailManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 08.02.24.
//

import Foundation

class ZodiacsAndYearsDetailManager: ZodiacsAndYearsDetailUseCase {
    func getZodiacsOrYearsDetail(id: String, type: String, completion: @escaping(ZodiacsAndYearsDetailResponseModel?, ErrorModel?) -> Void) {
        NetworkManager.request(model: ZodiacsAndYearsDetailResponseModel.self,
                               endpoint: ZodiacsAndYearsDetailEndpoint.zodiacsAndYearsDetail.rawValue + id + "?type=" + type,
                               completion: completion)
        print(ZodiacsAndYearsDetailEndpoint.zodiacsAndYearsDetail.rawValue + id + "?type=" + type)
    }
}
