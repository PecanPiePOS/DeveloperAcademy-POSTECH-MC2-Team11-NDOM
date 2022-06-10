//
//  register6.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct Register6: View {
    @State var inputText = ""
    @State var isLinkActive = false
    var body: some View {
        ZStack {
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    CustomTitle(titleText: "종").padding()
                    Spacer()
                }
                CustomTextField(inputText: $inputText, placeHolder: "고양이 종을 아신다면 알려주세요. ").padding()
                
                Spacer()
                
                NavigationLink(destination: Register7(), isActive: $isLinkActive) {
                    HStack {
                        Button {
                            isLinkActive = true
                        } label: {
                            CustomMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                        }
                        Button {
                            isLinkActive = true
                        } label: {
                            CustomMainButton(text: "다음", foreground: .white, background: .buttonColor)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct Register6_Previews: PreviewProvider {
    static var previews: some View {
        Register6()
    }
}
