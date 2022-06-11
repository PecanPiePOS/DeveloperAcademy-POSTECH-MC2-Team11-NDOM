//
//  register5.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct RegisterAge: View {
    @State var inputText = ""
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: GilCatInfoList
    
    var body: some View {
        ZStack {
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    GilCatTitle(titleText: "별명").padding([.top, .leading])
                    Spacer()
                }
                GilCatTextField(inputText: $inputText, placeHolder: "\(catInfo.infoList[catInfo.infoList.endIndex-1].name!)는 몇 살인가요?").padding([.leading, .bottom]).keyboardType(.numberPad)
                	
                Spacer()
                
                NavigationLink(destination: RegisterType(), isActive: $isLinkActive) {
                    HStack {
                        Button {
                            isLinkActive = true
                        } label: {
                            GilCatMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                        }
                        Button {
                            catInfo.infoList[catInfo.infoList.endIndex-1].age = inputText
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

struct RegisterAge_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAge()
    }
}
