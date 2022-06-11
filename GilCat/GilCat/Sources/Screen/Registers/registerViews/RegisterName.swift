import SwiftUI

struct RegisterName: View {
    @State var inputText = ""
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: GilCatInfoList
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                HStack {
                    GilCatTitle(titleText: "이름").padding([.top, .leading])
                    Spacer()
                }
                GilCatTextField(inputText: $inputText, placeHolder: "고양이 이름을 지어볼까요?").padding([.leading, .bottom])
                
                Spacer()
                
                NavigationLink(destination: RegisterGender(), isActive: $isLinkActive) {
                    Button {
                        catInfo.infoList[catInfo.infoList.endIndex-1].name = inputText
                        isLinkActive = true
                    } label: {
                        GilCatMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
                    }
                    .padding()
                }
            }
        }
    }
}
struct RegisterName_Previews: PreviewProvider {
    static var previews: some View {
        RegisterName()
    }
}
