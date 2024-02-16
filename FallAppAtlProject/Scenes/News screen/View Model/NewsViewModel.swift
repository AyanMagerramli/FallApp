//
//  NewsViewModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import Foundation

final class NewsViewModel {
    private let manager = NewsManager()
    var success: (() -> Void)?
    var error: ((ErrorModel) -> Void)?
    var newsList: NewsResponseModel?
    var coordinator: MainCoordinator?
    
    func getNewsList() {
        manager.getNewsList { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.success?()
                self.newsList = data
            }
        }
    }
}
