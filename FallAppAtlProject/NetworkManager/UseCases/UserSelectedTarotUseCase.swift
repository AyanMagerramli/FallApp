//
//  UserSelectedTarotUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 25.03.24.
//

import Foundation

protocol UserSelectedTarotUseCase {
    func chooseTarotCard (completion: @escaping((TarotSelectionSuccessModel?, ErrorModel?) -> Void))
}
