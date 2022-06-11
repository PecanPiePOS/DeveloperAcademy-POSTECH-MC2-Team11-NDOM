//
//  CatInfo.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/10.
//

import Combine

class CatInfoList : ObservableObject {
    var infoList = [CatInfo]()
}

struct CatInfo {
    var name: String?
    var age: String?
    var gender: String?
    var neutralized: String?
    var type: String?
    var imageName: String?

}
