//  register5.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct RegisterAge: View {
    @State var inputAge = ""
    @State var inputType = ""
    @State var isLinkActive = false
    @State var isShowingType = false
    @State var isFirstClick = true
    @FocusState var isFocused: Int?
    @EnvironmentObject var catInfo: GilCatDataManager
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    GilCatTitle(titleText: "나이").padding([.top, .leading])
                    Spacer()
                }
                
                GilCatTextField(inputText: $inputAge,
                                placeHolder: "\(catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].name)은(는) 몇 살인가요?")
                .padding([.leading, .bottom])
                .keyboardType(.numberPad)
                
                if isShowingType {
                    VStack {
                        HStack {
                            GilCatTitle(titleText: "종").padding([.top, .leading])
                            Spacer()
                        }
                        
                        GilCatTextField(inputText: $inputType, placeHolder: "\(catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].name)의 종을 아신다면 알려주세요. ").padding([.leading, .bottom]).focused($isFocused, equals: 2)
                    }.transition(.opacity)
                }
                Spacer()
                
                NavigationLink(destination: RegisterAvatar(), isActive: $isLinkActive) {
                    HStack {
                        
                        Button {
                            if isFirstClick {
                                withAnimation {
                                    isShowingType.toggle()
                                }
                                isFirstClick = false
                                isFocused = 2
                            }
                            else if inputAge.isEmpty && inputType.isEmpty {
                                isLinkActive = true
                            }
                            else if isFirstClick == false {
                                catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].age = inputAge
                            }
                        } label: {
                            GilCatMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                        }
                        
                        Button {
                            if isFirstClick {
                                withAnimation {
                                    isShowingType.toggle()
                                }
                                
                                isFirstClick = false
                                isFocused = 2
                            } else {
                                catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].age = inputAge
                                catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].type = inputType
                                isLinkActive = true
                            }
                        } label: {
                            GilCatMainButton(text: "다음", foreground: .white, background: .buttonColor)
                        }.frame(maxWidth: .infinity)
                    }
                    .padding()
                }
            }
            .navigationTitle("나이 & 종")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(.stack)
            // MARK: 툴바 수정
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                        .onTapGesture {
                            self.presentation.wrappedValue.dismiss()
                        }
                }
            }
            .focused($isFocused, equals: 1)
            .onAppear {
                // 뒤로가기로 돌아왔다면 기존에 입력했던 정보를 받아오기
                inputAge = catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].age
                inputType = catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].type
                
                // 화면이 나타나고 0.5초 뒤에 자동으로 입력칸에 포커스 되도록 하기
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isFocused = 1
                }
            }
        }
    }
}

struct RegisterAge_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAge().environmentObject(GilCatDataManager().self)
    }
}
