//
//  NewsUseCase.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import Foundation

protocol NewsUseCase {
    func getNewsList (completion: @escaping(NewsResponseModel?, ErrorModel?) -> Void)
}
