//  register5.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct RegisterAge: View {
    @Environment(\.presentationMode) private var presentation
    @FocusState private var isFocused: Int?
    @Binding private var viewModel: RegisterViewModel
    @State private var isLinkActive = false
    @State private var isShowingType = false
    @State private var isFirstClick = true
    private var catName: String = ""
    
    init(_ viewModel: Binding<RegisterViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(.all)
            VStack {
                getTitleView("나이")
                getAgeTextField()
                if isShowingType {
                    VStack {
                        getTitleView("종")
                        getTypeTextField()
                    }.transition(.opacity)
                }
                Spacer()
                getMainButtomView()
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
            .onAppear {
                // 화면이 나타나고 0.5초 뒤에 자동으로 입력칸에 포커스 되도록 하기
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isFocused = 1
                }
            }
        }
    }
    // 제목 뷰 반환하기
    @ViewBuilder
    private func getTitleView(_ text: String) -> some View {
        HStack {
            GilCatTitle(titleText: text).padding([.top, .leading])
            Spacer()
        }
    }
    // 나이 입력 필드 뷰 반환하기
    @ViewBuilder
    private func getAgeTextField() -> some View {
        GilCatTextField(inputText: $viewModel.age,
                        placeHolder: "\(viewModel.name)은(는) 몇 살인가요?")
               .padding([.leading, .bottom])
               .focused($isFocused, equals: 1)
               .keyboardType(.numberPad)
    }
    // 종 입력 필드 뷰 반환하기
    @ViewBuilder
    private func getTypeTextField() -> some View {
        GilCatTextField(inputText: $viewModel.type, placeHolder: "\(viewModel.name)의 종을 아신다면 알려주세요. ")
            .padding([.leading, .bottom])
            .focused($isFocused, equals: 2)
    }
    // 메인 버튼 뷰 반환하기
    @ViewBuilder
    private func getMainButtomView() -> some View {
        HStack {
            NavigationLink(destination: RegisterAvatar($viewModel), isActive: $isLinkActive) {
                Button {
                    if isFirstClick {
                        withAnimation {
                            isShowingType.toggle()
                        }
                        isFirstClick = false
                        isFocused = 2
                    } else if viewModel.age.isEmpty && viewModel.type.isEmpty {
                        isLinkActive = true
                    }
                } label: {
                    GilCatMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                }
            }
            NavigationLink(destination: RegisterAvatar($viewModel), isActive: $isLinkActive) {
                Button {
                    if isFirstClick {
                        withAnimation {
                            isShowingType.toggle()
                        }
                        isFirstClick = false
                        isFocused = 2
                    } else {
                        isLinkActive = true
                    }
                } label: {
                    GilCatMainButton(text: "다음", foreground: .white, background: .buttonColor)
                }.frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}

struct RegisterAge_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAge(.constant(RegisterViewModel()))
    }
}
