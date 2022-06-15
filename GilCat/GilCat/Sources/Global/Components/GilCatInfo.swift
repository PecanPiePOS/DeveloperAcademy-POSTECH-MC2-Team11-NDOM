//
//  CatInfo.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/10.
//

import Combine

// 고양이 정보 객체에 대한 리스트
class GilCatInfoList: ObservableObject {
    var infoList = [GilCatInfo.init(name: "김연호", age: "25", gender: "남자", neutralized: "x", type: "상남자", avatarColor: .emerald, avatarBodyIndex: 2, isUploadedToServer: true)]
    // EnvironmentObject 사용 시 PreView에 배열 index참조 오류 발생하여 default값으로 한가지 값 지정해둠
}

// 고양이 정보 객체
struct GilCatInfo {
    var name: String?
    var age: String?
    var gender: String?
    var neutralized: String?
    var type: String?
    var avatarColor: GilCatColor?
    var avatarBodyIndex: Int?
    var imageName: String? {
        guard let color = avatarColor,
              let body = avatarBodyIndex else {
            return nil
        }
        return color.group[body]
    }
    var isUploadedToServer: Bool = false
}
