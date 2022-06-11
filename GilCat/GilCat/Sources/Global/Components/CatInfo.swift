//
//  CatInfo.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/10.
//

import Combine

// 고양이 정보 객체에 대한 리스트
class CatInfoList: ObservableObject {
    var infoList = [CatInfo]()
}

// 고양이 정보 객체
struct CatInfo {
    var name: String?
    var age: String?
    var gender: String?
    var neutralized: String?
    var type: String?
    var imageName: String?

}
