//
//  Network Manager.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation
import Alamofire

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
                            // set new access token come from refresh token API here again into keychain
                            if let token = data.data?.accessToken {
                                KeychainManager.shared.setValue(value: token, for: KeychainValues.accessToken.rawValue)
                            }
                        }
                    } else if let error {
                        print("REFRESH ERROR IS \(error)")
                    }
                }
                
            } else if response.response?.statusCode == 499 {
                self.handleResponse(model: ErrorModel.self,
                                    data: response.data ?? Data()) { model in
                    print("Error is \(String(describing: model))")
                    UserDefaults.standard.setValue(false, forKey: "loggedIn")
                    KeychainManager.shared.deleteValue(key: KeychainValues.accessToken.rawValue)
                    KeychainManager.shared.deleteValue(key: KeychainValues.refreshToken.rawValue)
                    completion(nil, model)
                }
                
            } else if response.response?.statusCode == 404 {
                self.handleResponse(model: ErrorModel.self,
                                    data: response.data ?? Data()) { model in
                    print("Error is \(String(describing: model))")
                    completion(nil, model)
                }
            } else {
                self.handleResponse(model: ErrorModel.self,
                                    data: response.data ?? Data()) { model in
                    print("Error is \(String(describing: model))")
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
        
        // delete access token from store while call refresh token API
        KeychainManager.shared.deleteValue(key: KeychainValues.accessToken.rawValue)
        
        self.request(model: RefreshTokenSuccessModel.self,
                     endpoint: RefreshTokenEndpoint.refreshToken.rawValue,
                     parameters: tokenModel.dictionary,
                     method: .post,
                     encoding: JSONEncoding.default,
                     completion: completion)
    }
}
