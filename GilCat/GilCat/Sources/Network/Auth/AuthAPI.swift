//
//  AuthAPI.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import Moya

enum AuthAPI {
    case verifyInvitationCode(UserCode) // TODO: 어디에 쓰이는 API?
    case authLogin(UserCode)
    
    typealias UserCode = String
}

extension AuthAPI: TargetType {
    var path: String {
        switch self {
        case .verifyInvitationCode:
            return "/auth/invitation-codes"
        case .authLogin:
            return "/auth"
        }
    }
    
    var method: Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .verifyInvitationCode(let model), .authLogin(let model):
            return .requestJSONEncodable(model)
        }
    }
}
