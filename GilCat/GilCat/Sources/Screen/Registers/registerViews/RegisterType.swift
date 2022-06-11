//
//  register6.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct RegisterType: View {
    @State var inputText = ""
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: GilCatInfoList
    
    var body: some View {
        ZStack {
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    GilCatTitle(titleText: "종").padding()
                    Spacer()
                }
                GilCatTextField(inputText: $inputText, placeHolder: "고양이 종을 아신다면 알려주세요. ").padding()
                
                Spacer()
                
                NavigationLink(destination: RegisterAvatar(), isActive: $isLinkActive) {
                    HStack {
                        Button {
                            isLinkActive = true
                        } label: {
                            GilCatMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                        }
                        Button {
                            catInfo.infoList[catInfo.infoList.endIndex-1].type = inputText
                            isLinkActive = true
                        } label: {
                            GilCatMainButton(text: "다음", foreground: .white, background: .buttonColor)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct RegisterType_Previews: PreviewProvider {
    static var previews: some View {
        RegisterType()
    }
}
