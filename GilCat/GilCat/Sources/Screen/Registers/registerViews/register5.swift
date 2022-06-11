//
//  register5.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct Register5: View {
    @State var inputText = ""
    @State var isLinkActive = false
    @EnvironmentObject var catInfo : CatInfo
    
    var body: some View {
        ZStack {
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    CustomTitle(titleText: "나이").padding([.top, .leading])
                    Spacer()
                }
                CustomTextField(inputText: $inputText, placeHolder: "나비는 몇 살인가요?").padding([.leading, .bottom]).keyboardType(.numberPad)
                	
                Spacer()
                
                NavigationLink(destination: Register6(), isActive: $isLinkActive) {
                    HStack {
                        Button {
                            isLinkActive = true
                        } label: {
                            CustomMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                        }
                        Button {
                            catInfo.age = inputText
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

struct Register5_Previews: PreviewProvider {
    static var previews: some View {
        Register5()
    }
}
