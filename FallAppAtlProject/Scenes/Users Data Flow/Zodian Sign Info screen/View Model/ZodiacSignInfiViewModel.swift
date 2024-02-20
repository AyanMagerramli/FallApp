//
//  ZodiacSignInfiViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 03.02.24.
//

import Foundation

final class ZodiacSignInfiViewModel {
    var coordinator: MainCoordinator
    let zodiacSign = UserdefaultsManager.shared.getValue(for: "zodiacSign") ?? ""//UserDefaults.standard.value(forKey: "zodiacSign")
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}
