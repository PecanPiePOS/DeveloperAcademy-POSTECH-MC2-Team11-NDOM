//
//  CustomMainButton.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/10.
//

import SwiftUI

// 앱에서 메인 버튼으로 쓰이는 뷰
/*
 사용방법 :
    GilCatMainButton(text: 원하는 버튼 텍스트, foreground: 원하는 글자 색, background: 원하는 버튼 색)
 */

struct GilCatMainButton: View {
    @State var text: String
    @State var foreground: Color
    @State var background: Color
    
    var body: some View {
        Text(text)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(foreground)
                .background(background)
                .font(.system(size: 20, weight: Font.Weight.heavy))
                .cornerRadius(20)
    }
}

struct GilGatMainButton_Previews: PreviewProvider {
    static var previews: some View {
        GilCatMainButton(text: "다음", foreground: Color.white, background: Color.black)
    }
}
