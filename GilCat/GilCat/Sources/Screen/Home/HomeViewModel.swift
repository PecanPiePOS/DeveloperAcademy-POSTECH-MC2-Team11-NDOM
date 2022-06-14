//
//  HomeViewModel.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var catLists: [GilCatInfo] = [
        GilCatInfo(name: "나비 Dophie",
                   age: "2",
                   gender: .male,
                   neutralized: true,
                   type: "페르시안",
                   avatarColor: .gold,
                   avatarBodyIndex: 4,
                   dietInfo: DietInfo.initCat,
                   waterInfo: WaterInfo.initCat,
                   snackCount: 0,
                   healthTagInfo: [],
                   memoInfo: [],
                   gilCatMapInformation: .seventh)
    ]
    @Published var selectedIndex: Int = -1
    
    func catImageButtonTapped() {
        
    }
}
