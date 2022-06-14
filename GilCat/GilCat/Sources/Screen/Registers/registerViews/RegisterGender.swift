import SwiftUI

struct RegisterGender: View {
    @EnvironmentObject private var catInfo: GilCatDataManager
    @Environment(\.presentationMode) var presentation
    @State private var isLinkActive = false
    @State private var genderPick: GilCatPicker.Choice = .first
    @State private var neuralizedPick: GilCatPicker.Choice = .first
    @State private var isFirstClick: Bool = true
    @State private var isNeuralizedShowing: Bool = false
    private let firstChoiceOfGender = "수컷"
    private let secondChoiceOfGender = "암컷"
    private let firstChoiceOfNeuralized = "⭕️"
    private let secondChoiceOfNeuralized = "❌"
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(.all)
            VStack {
                getTitleView("성별")
                GilCatPicker(isClick: $genderPick, firstSelect: firstChoiceOfGender, secondSelect: secondChoiceOfGender)
                // 다음 버튼을 처음 누르고 난 뒤 페이드인 효과로 중성화 피커 나오게 함
                if isNeuralizedShowing {
                    VStack {
                        getTitleView("중성화 여부")
                        GilCatPicker(isClick: $neuralizedPick, firstSelect: firstChoiceOfNeuralized, secondSelect: secondChoiceOfNeuralized)
                    }.transition(.opacity)
                }
                Spacer()
                getMainButtomView()
            }
        }
        .navigationTitle("성별 및 중성화")
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
            // 뒤로가기로 돌아왔다면 기존에 입력했던 정보를 받아오기
            if firstChoiceOfGender == (catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].gender == .male ? firstChoiceOfGender : secondChoiceOfGender) {
                genderPick = .first
            } else {
                genderPick = .second
            }
            if firstChoiceOfNeuralized == (catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized ? firstChoiceOfNeuralized : secondChoiceOfNeuralized) {
                neuralizedPick = .first
            } else {
                neuralizedPick = .second
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
    // 메인 버튼 뷰 반환하기
    @ViewBuilder
    private func getMainButtomView() -> some View {
        NavigationLink(destination: RegisterAge(), isActive: $isLinkActive) {
            Button {
                // 어떤게 클릭됐는지에 따라 값 줘야함
                if isFirstClick {
                    withAnimation {
                        isNeuralizedShowing.toggle()
                    }
                    isFirstClick.toggle()
                } else {
                    if genderPick == .first {
                        catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].gender = .male
                    } else {
                        catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].gender = .female
                    }
                    if neuralizedPick == .first {
                        catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized = true
                    } else {
                        catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized = false
                    }
                    isLinkActive = true
                }
            } label: {
                GilCatMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
            }
            .padding()
        }
    }
}

struct RegisterGender_Previews: PreviewProvider {
    static var previews: some View {
        RegisterGender().environmentObject(GilCatDataManager().self)
    }
}
