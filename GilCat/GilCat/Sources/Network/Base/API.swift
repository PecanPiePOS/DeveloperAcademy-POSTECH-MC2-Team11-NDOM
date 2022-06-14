//
//  API.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import Foundation
import Moya

extension TargetType {
    var baseURL: URL {
        URL(string: "https://ebad3845-c82e-4c17-8284-107365ea3e67.mock.pstmn.io/api")!
    }
    
    var headers: [String: String]? {
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer " // TODO: 유저 정보를 저장해두어야함 (토큰 정보)
        ]
    }
}
