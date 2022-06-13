//
//  CustomPicker.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/09.
//

import SwiftUI

// 앱에 색깔에 맞춰서 두가지 선택지가 있는 피커 뷰
struct GilCatPicker: View {
    @State var isClick: Bool = true
    let firstSelect: String
    let secondSelect: String
    @Binding var selected: String

    var body: some View {
            ZStack {
                Rectangle().frame(width: 200, height: 50).cornerRadius(20).foregroundColor(.white).offset(x: isClick ? 100 : -100).onTapGesture {
                    // 하얀색과 배경이 같이 클릭될 시 안 움직이게 하는 방법
                    // 이 바로 아무것도 안 넣는 거 였다..!
                }
                HStack {
                    Text(firstSelect).bold().offset(x: -70).foregroundColor(isClick ? .white : .buttonColor)
                    Text(secondSelect).bold().offset(x: 70).foregroundColor(isClick ? .buttonColor : .white)
                }
            }.frame(width: 350, height: 50).background(Color.pickerColor).cornerRadius(20).onTapGesture {
                    withAnimation {
                    isClick.toggle()
                        if selected == secondSelect {
                            self.selected = firstSelect
                        } else {
                            self.selected = secondSelect
                        }
                    }
                }
        }
}
