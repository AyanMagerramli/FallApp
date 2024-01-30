//
//  LoginUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 30.01.24.
//

import Foundation

protocol LoginUseCase {
    func registerUser (loginData: LoginUserModel, completion: @escaping((LoginSuccessModel?, ErrorModel?)->Void))
}
