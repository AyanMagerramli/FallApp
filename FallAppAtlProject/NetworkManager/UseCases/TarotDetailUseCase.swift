//
//  TarotDetailUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 07.02.24.
//

import Foundation

protocol TarotDetailUseCase {
    func getTarotCardDetail(tarotId: String, completion: @escaping((TarotDetailResponseModel?, ErrorModel?) -> Void))
}
