//
//  AuthService.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import Foundation

struct AuthService {
    private let provider = NetworkProvider<AuthAPI>()
    
    typealias UserCode = String
    
    func verifyInvitationCode(_ code: UserCode, completion: @escaping (Bool) -> Void) {
        provider.request(.verifyInvitationCode(code)) { result in
            switch result {
            case .success:
                completion(true)
            case .failure:
                // TODO: statusCode로 에러처리해야하나? 리오랑 에러처리에 대해서 이야기해봐야함
                completion(false)
            }
        }
    }
    
    func login(_ code: UserCode, completion: @escaping (Bool) -> Void) {
        provider.request(.authLogin(code)) { result in
            switch result {
            case .success:
                completion(true)
            case .failure:
                // TODO: statusCode로 에러처리해야하나? 리오랑 에러처리에 대해서 이야기해봐야함
                completion(false)
            }
        }
    }
                           
}
