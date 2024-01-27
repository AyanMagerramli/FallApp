//
//  AstroLandEndpoints.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import Foundation

enum RegisterEndpoint: String {
    case register = "api/v1/astro-land/auth/registration"
    case resetOTP = "api/v1/astro-land/auth/reset-otp"
    case confirmation = "api/v1/astro-land/auth/confirmation"
}
