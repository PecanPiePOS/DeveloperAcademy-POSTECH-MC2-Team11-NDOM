//
//  UsersAPI.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import Moya

enum UsersAPI {
    case create(UserName)
    case getUser(UserCode)
    case getHealthTags
    case createHealthTags(TagName)
    case getCatFood
    case createDietTag(FoodName)
    
    typealias UserName = String
    typealias UserCode = String
    typealias TagName = String
    typealias FoodName = String
}

extension UsersAPI: TargetType {
    // MARK: 경로
    var path: String {
        switch self {
        case .create, .getUser:
            return "/users"
        case .getHealthTags, .createHealthTags:
            return "/users/health-tags"
        case .getCatFood:
            return "/cat/food"
        case .createDietTag:
            return "/users/diet-tags"
        }
    }
    
    // MARK: REST API 형식
    var method: Method {
        switch self {
        case .create:
            return .post
        case .getUser:
            return .get
        case .getHealthTags:
            return .get
        case .createHealthTags:
            return .post
        case .getCatFood:
            return .get
        case .createDietTag:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .create(let model):
            return .requestJSONEncodable(model)
        case .getUser(let model):
            return .requestParameters(parameters: model.dictionary, encoding: URLEncoding.default)
        case .getHealthTags:
            return .requestPlain
        case .createHealthTags(let model):
            return .requestJSONEncodable(model)
        case .getCatFood:
            return .requestPlain
        case .createDietTag(let model):
            return .requestJSONEncodable(model)
        }
    }
}
