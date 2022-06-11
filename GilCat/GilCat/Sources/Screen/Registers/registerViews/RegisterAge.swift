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
    @FocusState var isFocused: Bool?
    @EnvironmentObject var catInfo: GilCatInfoList
    
    var body: some View {
        ZStack {
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    GilCatTitle(titleText: "나이").padding([.top, .leading])
                    Spacer()
                }
                GilCatTextField(inputText: $inputText, placeHolder: "\(catInfo.infoList[catInfo.infoList.endIndex-1].name!)은(는) 몇 살인가요?").padding([.leading, .bottom])
                	
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
            .navigationBarTitle("나이", displayMode: .inline)
            .focused($isFocused, equals: true)
            .onAppear {
                // 화면이 나타나고 0.5초 뒤에 자동으로 입력칸에 포커스 되도록 하기
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFocused = true
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
