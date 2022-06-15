//
//  RegisterViewModel.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/14.
//

import SwiftUI

class NewCatModel: ObservableObject {
    @Published var name: String                = ""            // 이름
    @Published var age: String                 = ""            // 나이
    @Published var code: String                = ""            // 공유 코드
    @Published var gender: GilCatGender        = .male         // 성별
    @Published var neutralized: Bool           = true          // 중성화 여부
    @Published var type: String                = ""            // 종
    @Published var avatarColor: GilCatColor    = .gray         // 아바타 색깔
    @Published var avatarBodyIndex: Int        = 0             // 아바타 몸
    var imageName: String {                   // 아바타 이미지
        return avatarColor.group[avatarBodyIndex]
    }
}
