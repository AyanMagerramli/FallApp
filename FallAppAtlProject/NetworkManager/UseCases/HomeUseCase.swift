//
//  HomeUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 05.02.24.
//

import Foundation

protocol HomeUseCase {
    func loadUserSignsPredictions (completion: @escaping((HomeSuccessModel?, ErrorModel?)->Void))
}
