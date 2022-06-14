//
//  NetworkProvider.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import Foundation
import Moya

final class NetworkProvider<Target: TargetType>: MoyaProvider<Target> {
    private let logging = NetworkLogging()
    
    init() {
        super.init(plugins: [logging])
    }
    
    func request<T: Decodable>(_ token: Target, completion: @escaping (Result<T, MoyaError>) -> Void) {
        self.request(token) { result in
            switch result {
            case .success(let data):
                do {
                    completion(.success(try data.map(T.self)))
                } catch let error {
                    print("NetworkProvider.swift에서 데이터 파싱하다가 에러남 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️", error)
                }
            case .failure(let error):
                // TODO: 에러처리, 실패할 경우 이곳으로 보내므로 이거 처리해주어야 한다.
                print("네트워크 레이어에서 에러남 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️")
                completion(.failure(error))
                
            }
        }
    }
}
