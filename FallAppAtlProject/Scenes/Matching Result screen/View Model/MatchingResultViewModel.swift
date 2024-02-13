//
//  MatchingResultViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

final class  MatchingResultViewModel {
    
    private let manager = MatchingResultManager()
    var coordinator: MainCoordinator
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var result: MatchingResultSuccessModel?
    var body: MatchingResultBodyModel
    
    init(coordinator: MainCoordinator, body: MatchingResultBodyModel) {
        self.coordinator = coordinator
        self.body = body
    }
    
    func getMatchingResult(body: MatchingResultBodyModel) {
        manager.getMatchingResult(body: body) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.result = data
                self.success?()
            }
        }
    }
}
