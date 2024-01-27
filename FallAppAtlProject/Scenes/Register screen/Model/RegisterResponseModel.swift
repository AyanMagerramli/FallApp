//
//  RegisterResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation

// MARK: - RegisterResponse

struct RegisterResponseModel: Codable {
    let data: DataClass?
    let message: String?
    let type: String?
    let title: String?
    let status: String?
    let detail: String?    
}

// MARK: - DataClass

struct DataClass: Codable {
    let message: String?
}

/*
 {
     "type": "about:blank",
     "title": "Conflict",
     "status": 409,
     "detail": "Mail is already exists",
     "instance": "/api/v1/astro-land/auth/registration",
     "reason": "already_present_exception"
 }
 */
