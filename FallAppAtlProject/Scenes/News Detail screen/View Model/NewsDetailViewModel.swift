//
//  NewsDetailViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import Foundation

final class NewsDetailViewModel {
    
    var coordinator: MainCoordinator
    var selectedItem: News
    
    init ( coordinator: MainCoordinator, selectedItem: News ) {
        self.coordinator = coordinator
        self.selectedItem = selectedItem
    }
}
