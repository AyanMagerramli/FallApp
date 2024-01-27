//
//  Network Helper.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let baseURL = "http://184.73.181.83:8080/"
    static let header: HTTPHeaders? = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NmY0MTg4ZGQzZGM3ZjIwNmFlYjhiZDI4Nzc0OTFkYiIsInN1YiI6IjY1NmFmMTI2ODgwNTUxMDEzYTQ3OTE1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gm44lL1anWWkmtdAYM87ZlanKMQwdYrgb7KU-S7_e5M"]
}

