//
//  MatchingResultSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

struct MatchingResultSuccessModel: Codable {
    let data: MatchingData?
    let message: String?
}

struct MatchingData: Codable {
    let message: String?
}
