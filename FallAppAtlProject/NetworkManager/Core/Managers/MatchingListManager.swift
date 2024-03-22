//
//  MatchingListManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

class MatchingListManager: MatchingListUseCase {
    func getMatchingList(completion: @escaping (ZodiacSignsMatchingListModel?, ErrorModel?) -> Void) {
        NetworkManager.request(model: ZodiacSignsMatchingListModel.self,
                               endpoint: MatchingListEndpoint.matchingList.rawValue,
                               completion: completion)
    }
}
