//
//  MatchingResultBodyModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import Foundation

struct MatchingResultBodyModel: Codable {
    var firstZodiacID, secondZodiacID: String?

    enum CodingKeys: String, CodingKey {
        case firstZodiacID = "firstZodiacId"
        case secondZodiacID = "secondZodiacId"
    }
    
    var dictionary: [String: Any] {
        return [
            "firstZodiacId": firstZodiacID ?? "",
            "secondZodiacId": secondZodiacID ?? ""
        ]
    }
}

  
