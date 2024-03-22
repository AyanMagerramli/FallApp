//
//  TarotSelectionMAnager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.02.24.
//

import Foundation
import Alamofire

class TarotSelectionManager: TarotSelectionUseCase {
    func chooseTarotCard(body: TarotSelectionRequestModel, completion: @escaping ((TarotSelectionSuccessModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: TarotSelectionSuccessModel.self,
                               endpoint: TarotSelectionEndpoint.tarotSelection.rawValue,
                               parameters: body.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}
