//
//  LogoutUseCAse.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

protocol LogoutUseCase {
    func logoutUser(completion: @escaping((LogoutSuccessModel?, ErrorModel?) -> Void))
}
