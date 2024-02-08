//
//  ZodiacsAndYearsDetailUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 08.02.24.
//

import Foundation

protocol ZodiacsAndYearsDetailUseCase {
    func getZodiacsOrYearsDetail(id: String, type: String, completion: @escaping(ZodiacsAndYearsDetailResponseModel?, ErrorModel?) -> Void)
}
