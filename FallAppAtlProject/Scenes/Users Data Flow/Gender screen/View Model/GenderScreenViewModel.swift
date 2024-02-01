//
//  GenderScreenViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 02.02.24.
//

import Foundation
class GenderScreenViewModel {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    var userDataModel: UploadUserDataModel?
    let manager = UploadManager()
    var errorResponse: ErrorModel?
    var error: ((ErrorModel) -> Void)?
    var success: (() -> Void)?
    
    
    func uploadUserData(userData: UploadUserDataModel) {
        manager.uploadUserData(userData: userData) { data, error in
            if let error {
                self.errorResponse = error
                self.error?(error)
            } else if let data {
                //self.userDataModel = data
                self.success?()
            }
        }
    }
    
    
    // MARK: - init
    
    init(coordinator: MainCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
}
