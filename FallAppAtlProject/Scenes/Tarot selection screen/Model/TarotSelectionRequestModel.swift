//
//  TarotSelectionRequestModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.02.24.
//

import Foundation

struct TarotSelectionRequestModel: Codable {
    let id: String?
    
    var dictionary: [String : Any] {
        return [ "id" : id ?? ""]
    }
}

/*
 "id": "0676a071-7d11-4089-8c90-0780fff00959"
 */
