//
//  ZodiacSignsMatchingSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

struct ZodiacSignsMatchingListModel: Codable {
    let data: [Signs]?
    let message: String?
}

struct Signs: Codable, OnlyImageCellProtocol {
    let id: String?
    let image: String?
    
    // OnlyImageCellProtocol stubs
    
    var imagee: String {
        image ?? ""
    }
}
