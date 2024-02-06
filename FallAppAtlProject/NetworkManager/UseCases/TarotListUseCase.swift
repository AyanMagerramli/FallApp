//
//  TarotListUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

protocol TarotListUseCase {
    func loadTarotList (completion: @escaping((TarotDataModel?, ErrorModel?)->Void))
}
