//
//  ZodiacSignsViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 07.02.24.
//

import Foundation

final class ZodiacsAndYearsViewModel {
    
    var coordinator: MainCoordinator?
    private let manager = ZodiacsAndYearsManager()
    var error: ((ErrorModel?) -> Void)?
    var success: (() -> Void)?
    var responseList: ZodiacsAndYearsResponseModel?
    
    func getAllZodiacsAndYearsList() {
        manager.getZodiacsAndYearsList { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
                self.responseList = data
            }
        }
    }
}
