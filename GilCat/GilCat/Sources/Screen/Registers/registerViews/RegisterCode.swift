//
//   register2.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct RegisterCode: View {
    @Environment(\.presentationMode) private var presentation
    @FocusState private var isFocused: Bool?
    @Binding private var newCat: RegisterViewModel
    @State private var isLinkActive = false
    @State private var isAlertActice = false
    
    init(_ viewModel: Binding<RegisterViewModel>) {
        UITextView.appearance().backgroundColor = .clear
        self._newCat = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(.all)
            VStack {
                CustomSubTitle(text: "※ 다른 사람과 공유할 시, 개인 메모를 제외한 이전 기록이 모두 공유됩니다. ")
                getTitleView("공유 코드")
                getTotalCodeInputView()
                Spacer()
                getMainButtomView()
            }
            .navigationTitle("공유코드")
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
            .background(Color.backgroundColor)
            .alert("코드를 모두 입력하거나 건너뛰기를 눌러주세요", isPresented: $isAlertActice) {
                Button("확인") {}
            }
            .onAppear {
                // 화면이 나타나고 0.5초 뒤에 자동으로 공유코드 첫번째 입력칸에 포커스 되도록 하기
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isFocused = true
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
    // 각각의 코드 입력 칸 뷰 한개 반환하기
    @ViewBuilder
    private func getCodeInputView(index: Int) -> some View {
        Text(getChar(index))
            .frame(width: 50, height: 65)
            .background(Color.pickerColor)
            .cornerRadius(20)
            .foregroundColor(Color.white)
            .font(.system(size: 40, weight: Font.Weight.heavy))
    }
    // 코드 입력 칸 전체 반환하기
    @ViewBuilder
    private func getTotalCodeInputView() -> some View {
        ZStack {
            TextField("", text: $newCat.code)
                .frame(width: 0, height: 0)
                .focused($isFocused, equals: true)
                .keyboardType(.numberPad)
                .onChange(of: newCat.code) { _ in
                    if newCat.code.count > 6 {
                        newCat.code = String(newCat.code.prefix(6))
                    }
                }
            HStack {
                getCodeInputView(index: 0)
                getCodeInputView(index: 1)
                getCodeInputView(index: 2)
                getCodeInputView(index: 3)
                getCodeInputView(index: 4)
                getCodeInputView(index: 5)
            }
        }
        .padding()
    }
    // 메인 버튼 뷰 반환하기
    @ViewBuilder
    private func getMainButtomView() -> some View {
        HStack {
            NavigationLink(destination: RegisterName($newCat), isActive: $isLinkActive) {
                Button {
                    isLinkActive = true
                } label: {
                    GilCatMainButton(text: "건너뛰기", foreground: .white, background: .pickerColor)
                }
            }
            NavigationLink(destination: RegisterName($newCat), isActive: $isLinkActive) {
                Button {
                    // TODO: 코드에 따라 서버에서 다른 고양이 룸 정보 받아오기
                    // 코드가 다 입력이 안됐다면, 팝업 창 보여주기
                    if newCat.code.count != 6 {
                        isAlertActice = true
                    } else {
                        isLinkActive = true
                    }
                } label: {
                    GilCatMainButton(text: "다음", foreground: .white, background: .buttonColor)
                }
            }
        }
        .padding()
    }
    // 캐릭터 반환하기
    private func getChar(_ index: Int) -> String {
        var codes = ["", "", "", "", "", ""]
        for (idx, code) in newCat.code.enumerated() {
            if newCat.code.count > 6 {
                break
            }
            codes[idx] = String(code)
        }
        return codes[index]
    }
}

struct RegisterCode_Previews: PreviewProvider {
    static var previews: some View {
        RegisterCode(.constant(RegisterViewModel()))
    }
}
