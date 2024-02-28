//
//  TarotSelectionUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.02.24.
//

import Foundation

protocol TarotSelectionUseCase {
    func chooseTarotCard(body: TarotSelectionRequestModel, completion: @escaping((TarotSelectionSuccessModel?, ErrorModel?) -> Void))
}
