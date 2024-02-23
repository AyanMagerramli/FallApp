//
//  ConfirmOTPSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

struct SendOTPSuccessModel: Codable {
    let data: String?
    let message: String?
}

/*
 {
     "data": "We sent otp code to your mail",
     "message": "SUCCESS"
 }
 */
