//
//  ErrorModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation

struct ErrorModel: Codable {
    let type: String?
    let title: String?
    let status: Int?
    let detail: String?
    let instance: String?
    let reason: String?
}
