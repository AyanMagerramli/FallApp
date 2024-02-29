//
//  StoredSelectedTarotInfo.swift
//  FallAppAtlProject
//
//  Created by Ayan on 29.02.24.
//

import Foundation

// singleton for saving selected tarot card details and use it for showing user its card in another screen

class StoredSelectedTarotInfo {
    
    static let shared = StoredSelectedTarotInfo()
    
    var tarotImage: String?
    var tarotInf0: String?
}
