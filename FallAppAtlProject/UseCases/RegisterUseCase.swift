//
//  RegisterUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import Foundation

protocol RegisterUseCase {
    func registerUser (registerData: RegisterUserModel, completion: @escaping((RegisterResponseModel?, String?)->Void))
}
