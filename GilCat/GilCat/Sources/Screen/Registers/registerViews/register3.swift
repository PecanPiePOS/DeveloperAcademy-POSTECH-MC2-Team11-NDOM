import SwiftUI

struct Register3: View {
    @State var inputText = ""
    @State var isLinkActive = false
    @State var catInfo: CatInfo
    
    init(_ catInfo: CatInfo) {
        self.catInfo = catInfo
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                HStack {
                    CustomTitle(titleText: "이름").padding([.top, .leading])
                    Spacer()
                }
                CustomTextField(inputText: $inputText, placeHolder: "고양이 이름을 지어볼까요?").padding([.leading, .bottom])
                
                Spacer()
                
                NavigationLink(destination: Register4(catInfo), isActive: $isLinkActive) {
                    Button {
                        catInfo.name = inputText
                        isLinkActive = true
                    } label: {
                        CustomMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
                    }
                    .padding()
                }
            }
        }
    }
}
struct Register3_Previews: PreviewProvider {
    static var previews: some View {
        Register3(CatInfo())
    }
}
