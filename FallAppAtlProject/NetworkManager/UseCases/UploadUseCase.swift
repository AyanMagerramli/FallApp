//
//  UploadUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation

protocol UploadUseCase {
    func uploadUserData (userData: UploadUserDataModel, completion: @escaping((UploadUserSuccessModel?, ErrorModel?)->Void))
}

