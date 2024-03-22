//
//  UploadManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation
import Alamofire

class UploadManager: UploadUseCase {
    func uploadUserData(userData: UploadUserDataModel, completion: @escaping ((UploadUserSuccessModel?, ErrorModel?) -> Void)) {
        NetworkManager.request(model: UploadUserSuccessModel.self,
                               endpoint: UploadEndpoint.upload.rawValue,
                               parameters: userData.dictionary,
                               method: .post,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}

