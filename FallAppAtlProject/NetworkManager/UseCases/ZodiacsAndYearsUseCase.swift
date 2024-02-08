//
//  ZodiacsAndYearsUsecase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 08.02.24.
//

import Foundation

protocol ZodiacsAndYearsUseCase {
    func getZodiacsAndYearsList(completion: @escaping(ZodiacsAndYearsResponseModel?, ErrorModel?) -> Void)
}
