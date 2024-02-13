//
//  ZodiacSignsMatchingViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

final class ZodiacSignsMatchingListViewModel {
    
    private let manager = MatchingListManager()
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var responseData: ZodiacSignsMatchingListModel?
    var coordinator: MainCoordinator
    var matchingResultBody: MatchingResultBodyModel?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func getMatchingList() {
        manager.getMatchingList { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
                self.responseData = data
            }
        }
    }
}
