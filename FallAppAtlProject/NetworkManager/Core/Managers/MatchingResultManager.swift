//
//  MatchingResultManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation
import Alamofire

class MatchingResultManager: MatchingResultUseCase {
    func getMatchingResult(body: MatchingResultBodyModel, completion: @escaping ((MatchingResultSuccessModel?, ErrorModel?) -> Void)) {
        NetworkManager.request( model: MatchingResultSuccessModel.self,
                                endpoint: MatchingResultEndpoint.result.rawValue,
                                parameters: body.dictionary,
                                method: .post,
                                encoding: JSONEncoding.default,
                                completion: completion)
    }
}
