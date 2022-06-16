//
//  CatInfo.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/10.
//

import Combine
import Foundation

// MARK: 한 마리 고양이 정보 객체
struct GilCatInfo {
    var name: String                = ""            // 이름
    var age: String                 = ""            // 나이
    var gender: GilCatGender        = .male         // 성별
    var neutralized: Bool           = true          // 중성화 여부
    var type: String                = ""            // 종
    var avatarColor: GilCatColor    = .gray         // 아바타 색깔
    var avatarBodyIndex: Int        = 0             // 아바타 몸
    var imageName: String {                         // 아바타 이미지
        return avatarColor.group[avatarBodyIndex]
    }
    var dietInfo: DietInfo          = .initCat
    var waterInfo: WaterInfo        = .initCat
    var snackCount: Int             = 0
    var healthTagInfo: [String]     = []
    var memoInfo: [MemoInfo]        = []
    var gilCatMapInformation: GilCatMapCase = .none

}

extension GilCatInfo {
    static let empty = GilCatInfo(name: "",
                                  age: "",
                                  gender: .male,
                                  neutralized: true,
                                  type: "",
                                  avatarColor: .gold,
                                  avatarBodyIndex: 4,
                                  dietInfo: DietInfo.initCat,
                                  waterInfo: WaterInfo.initCat,
                                  snackCount: 0,
                                  healthTagInfo: [],
                                  memoInfo: [],
                                  gilCatMapInformation: .seventh)
}

// MARK: 먹이 정보
struct DietInfo {
    var name: String
    var timeIndex: Int
    var time: String {
        GilCatTimePicker.testTime[timeIndex]
    }
    var amount: Amount
    
    static let initCat: DietInfo = DietInfo(name: "-", timeIndex: 28, amount: .mid)
}

// MARK: 물 정보
struct WaterInfo {
    var timeIndex: Int
    var time: String {
        GilCatTimePicker.testTime[timeIndex]
    }
    var amount: Amount
    
    static let initCat: WaterInfo = WaterInfo(timeIndex: 28, amount: .mid)
}

// MARK: 메모 정보 
struct MemoInfo: Hashable {
    var date: String
    var time: String
    var content: String
}

// MARK: 태그 정보
struct HealthTag: Hashable {
    init(_ text: String, isClicked: Bool = false) {
        self.text = text
        self.isClicked = isClicked
    }
    var id = UUID().uuidString
    var text: String
    var isClicked = false
}

enum Amount {
    case full
    case mid
    case less

    var str: String {
        switch self {
        case .full:
            return "100%"
        case .mid:
            return "50%"
        case .less:
            return "25%"
        }
    }
}

enum GilCatGender: String {
    case male
    case female
}
