//
//  MatchingResultUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

protocol MatchingResultUseCase {
    func getMatchingResult (body: MatchingResultBodyModel, completion: @escaping((MatchingResultSuccessModel?, ErrorModel?)->Void))
}
