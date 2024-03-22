//
//  NewsManager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import Foundation

class NewsManager: NewsUseCase {
    func getNewsList(completion: @escaping (NewsResponseModel?, ErrorModel?) -> Void) {
        NetworkManager.request(model: NewsResponseModel.self,
                               endpoint: NewsEndpoint.news.rawValue,
                               completion: completion)
    }
}
