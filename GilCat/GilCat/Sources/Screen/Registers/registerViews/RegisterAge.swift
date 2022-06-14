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
    @Binding var buildNavigationStack: Bool
    @State var isShowingType = false
    @State var isFirstClick = true
    @State var isFieldEmpty = true
    @FocusState var isFocused: Int?
    @EnvironmentObject var catInfo: GilCatInfoList
    @Environment(\.presentationMode) var presentation
    
    init(_ buildNavigationStack: Binding<Bool>) {
        Theme.navigationBarColors(background: .systemFill, titleColor: .white)
        self._buildNavigationStack = buildNavigationStack
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(.all)
        
            VStack {
                HStack {
                    GilCatTitle(titleText: "나이").padding([.top, .leading])
                    Spacer()
                }
                
                GilCatTextField(inputText: $inputAge, placeHolder: "\(catInfo.infoList[catInfo.infoList.endIndex-1].name!)은(는) 몇 살인가요?").padding([.leading, .bottom])
                    .keyboardType(.numberPad)
                
                if isShowingType {
                    VStack {
                        HStack {
                            GilCatTitle(titleText: "종").padding([.top, .leading])
                            Spacer()
                        }
                        
                        GilCatTextField(inputText: $inputType, placeHolder: "\(catInfo.infoList[catInfo.infoList.endIndex-1].name!)의 종을 아신다면 알려주세요. ").padding([.leading, .bottom]).focused($isFocused, equals: 2)
                    }.transition(.opacity)
                }
                Spacer()
                
                NavigationLink(destination: RegisterAvatar($buildNavigationStack), isActive: $isLinkActive) {
                    HStack {
                        
                        Button {
                            if isFirstClick {
                                withAnimation {
                                    isShowingType.toggle()
                                }
                            }else if inputType.isEmpty {//나이값만 입력하고 건너뛰기를 할 경우 나이값은 서버로 보내줘야 함
                                catInfo.infoList[catInfo.infoList.endIndex-1].age = inputAge
                                isLinkActive = true
                            }
                            isFirstClick = false
                            isFocused = 2
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
                            }else if inputAge.isEmpty {//나이 입력안하고 종값만 입력했을때
                                catInfo.infoList[catInfo.infoList.endIndex-1].type = inputType
                                isLinkActive = true
                            }else {
                                catInfo.infoList[catInfo.infoList.endIndex-1].age = inputAge
                                catInfo.infoList[catInfo.infoList.endIndex-1].type = inputType
                                isLinkActive = true
                            }
                        } label: {
                            GilCatMainButton(text: "다음", foreground: .white, background: .buttonColor)
                        }.frame(maxWidth: .infinity)
                    }
                    .padding()
                }
                .isDetailLink(false)
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
                if !catInfo.infoList[catInfo.infoList.endIndex-1].isUploadedToServer &&  catInfo.infoList[catInfo.infoList.endIndex-1].age != nil {
                    inputAge = catInfo.infoList[catInfo.infoList.endIndex-1].age!
                }
                if !catInfo.infoList[catInfo.infoList.endIndex-1].isUploadedToServer &&  catInfo.infoList[catInfo.infoList.endIndex-1].type != nil {
                    inputType = catInfo.infoList[catInfo.infoList.endIndex-1].type!
                }

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
        RegisterAge(.constant(false)).environmentObject(GilCatInfoList().self)
    }
}
