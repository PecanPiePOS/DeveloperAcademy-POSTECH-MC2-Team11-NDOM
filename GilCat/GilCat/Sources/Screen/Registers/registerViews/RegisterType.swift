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
    @FocusState var isFocused: Bool?
    @EnvironmentObject var catInfo: GilCatInfoList
 
    var body: some View {
        ZStack {
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    GilCatTitle(titleText: "종").padding([.top, .leading])
                    Spacer()
                }
                GilCatTextField(inputText: $inputText, placeHolder: "\(catInfo.infoList[catInfo.infoList.endIndex-1].name!)의 종을 아신다면 알려주세요. ").padding([.leading, .bottom])
                
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
            .navigationBarTitle("종", displayMode: .inline)
            .focused($isFocused, equals: true)
            .onAppear {
                // 뒤로가기로 돌아왔다면 기존에 입력했던 정보를 받아오기
                if !catInfo.infoList[catInfo.infoList.endIndex-1].isUploadedToServer &&  catInfo.infoList[catInfo.infoList.endIndex-1].type != nil {
                    inputText = catInfo.infoList[catInfo.infoList.endIndex-1].type!
                }
                // 화면이 나타나고 0.5초 뒤에 자동으로 입력칸에 포커스 되도록 하기
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFocused = true
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
