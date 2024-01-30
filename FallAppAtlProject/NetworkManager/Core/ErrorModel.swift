//
//  ErrorModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation

// Error Model stays the same for each API, use only this one each time

struct ErrorModel: Codable {
    let type: String?
    let title: String?
    let status: Int?
    let detail: String?
    let instance: String?
    let reason: String?
}
