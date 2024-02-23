//
//  ResetPasswordUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

protocol ResetPasswordUseCase {
    func resetPassword (body: ResetPasswordResponseModel,
                        completion: @escaping ((ResetPasswordSuccessModel?, ErrorModel?) -> Void))
}
