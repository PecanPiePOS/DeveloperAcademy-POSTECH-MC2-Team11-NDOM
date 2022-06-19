//
//  NoteViewModel.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/15.
//

import SwiftUI

class InfoToNote: ObservableObject {
    @Published var name: String                = "마시멜랑"        // 이름
    @Published var age: String                 = "안알랴쥼"      // 나이
    @Published var gender: GilCatGender        = .male         // 성별
    @Published var neutralized: Bool           = true          // 중성화 여부
    @Published var type: String                = "코숏"         // 종
    @Published var imageName: String           = "cat_orange_1"// 프로필 이미지
    @Published var dietInfo: DietInfo          = .initCat      // 사료 정보
    @Published var waterInfo: WaterInfo        = .initCat      // 물 정보
    @Published var snackCount: Int             = 0             // 간식 개수
    @Published var healthTagInfo: [HealthTag]  = []            // 건강 태그
    @Published var memoInfo: [MemoInfo]        = []            // 메모 정보
}
