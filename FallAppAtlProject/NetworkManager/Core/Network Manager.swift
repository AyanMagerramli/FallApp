//
//  Network Manager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation
import Alamofire
import KeychainSwift

class NetworkManager {
    
    static func request<T: Codable>(
        model: T.Type,
        endpoint: String?,
        parameters: Parameters? = nil,
        method: HTTPMethod = .get,
        encoding: ParameterEncoding = URLEncoding.default,
        completion: @escaping((T?, ErrorModel?) -> Void)
    ) {
        AF.request("\(NetworkHelper.baseURL)\(endpoint ?? "")",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkHelper.getHeader()).responseData { response in
            
            if response.response?.statusCode == 200 {
                if let data = response.data {
                    self.handleResponse(model: T.self,
                                        data: data) { model in
                        completion(model, nil)
                    }
                }

            } else if response.response?.statusCode == 401 {
                refreshToken { data, error in
                    if let data {
                        self.handleResponse(model: T.self,
                                            data: response.data!) { model in
                            completion(model, nil)
                            // set access token here again into keychain
                            let keychain = KeychainSwift()
                            if let token = data.data?.accessToken {
                                keychain.set(token, forKey: "accessToken")
                            }
                        }
                    } else if let error {
                        
                    }
                }
                
            } else {
                self.handleResponse(model: ErrorModel.self,
                                    data: response.data ?? Data()) { model in
                    completion(nil, model)
                }
            }
        }
    }
    
    fileprivate static func handleResponse<T: Codable>(model: T.Type, data: Data, completion: @escaping((T?)->())) {
        let result = try? JSONDecoder().decode(T.self, from: data)
        completion(result)
    }
    
    fileprivate static func refreshToken(completion: @escaping (RefreshTokenSuccessModel?, ErrorModel?) -> Void) {
        let tokenModel = RefreshTokenModel()
        KeychainSwift().set("", forKey: "accessToken")
        self.request(model: RefreshTokenSuccessModel.self,
                     endpoint: RefreshTokenEndpoint.refreshToken.rawValue,
                     parameters: tokenModel.dictionary,
                     method: .post,
                     encoding: JSONEncoding.default,
                     completion: completion)
    }
}
