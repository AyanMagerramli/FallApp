//
//  Network Helper.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation
import Alamofire
import KeychainSwift

class NetworkHelper {
// tokeni keychainden alacaqsan,  login ekranda gelen response-dan refresh ve access tokeni keychainde save ediceksin
    static let baseURL = "http://184.73.181.83:8080/"
    static let header: HTTPHeaders? = [
        "accept": "application/json",
        "Authorization": ""]
}

