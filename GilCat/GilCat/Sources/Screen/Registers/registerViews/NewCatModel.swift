//
//  RegisterViewModel.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/14.
//

struct NewCatModel {
    var name: String                = ""            // 이름
    var age: String                 = ""            // 나이
    var code: String                = ""            // 공유 코드
    var gender: GilCatGender        = .male         // 성별
    var neutralized: Bool           = true          // 중성화 여부
    var type: String                = ""            // 종
    var avatarColor: GilCatColor    = .gray         // 아바타 색깔
    var avatarBodyIndex: Int        = 0             // 아바타 몸
    var imageName: String {                         // 아바타 이미지
        return avatarColor.group[avatarBodyIndex]
    }
}
