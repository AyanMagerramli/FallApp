//
//  ZodiacsAndYearsDetailViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 08.02.24.
//

import Foundation

final class ZodiacsAndYearsDetailViewModel {
    
    var coordinator: MainCoordinator
    var id: String
    var type: String
    private let manager = ZodiacsAndYearsDetailManager()
    var error: ((ErrorModel?) -> Void)?
    var success: (() -> Void)?
    var responseList: ZodiacsAndYearsDetailResponseModel?
    
    init (coordinator: MainCoordinator, id: String, type: String) {
        self.coordinator = coordinator
        self.id = id
        self.type = type
    }
    
    func getZodiacOrYearDetail() {
        manager.getZodiacsOrYearsDetail(id: self.id, type: self.type) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
                self.responseList = data
            }
        }
    }
}
