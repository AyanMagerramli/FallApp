//
//  GenderScreenViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation
class GenderViewModel {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    var userDataModel = UploadUserDataModel()
    let manager = UploadManager()
    var errorResponse: ErrorModel?
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    var successModel: UploadUserSuccessModel?    
    
    func uploadUserData(userData: UploadUserDataModel) {
        manager.uploadUserData(userData: userData) { data, error in
            if let error {
                self.errorResponse = error
                print("ERROR ISS \(String(describing: error.detail))")
                self.error?(error)
            } else if let data {
                self.successModel = data
                print("SUCCESSSS ISSS \(String(describing: self.successModel?.data))")
                self.success?()
            }
        }
    }
        
    // MARK: - init
    
    init(coordinator: MainCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
}
