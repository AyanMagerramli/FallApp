//
//  MatchingListUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

protocol MatchingListUseCase {
    func getMatchingList(completion: @escaping(ZodiacSignsMatchingListModel?, ErrorModel?) -> Void)
}
