import SwiftUI

struct Register3: View {
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                HStack {
                    CustomTitle(titleText: "이름").padding([.top, .leading])
                    Spacer()
                }
                CustomTextField(placeHolder: "고양이 이름을 지어볼까요?").padding([.leading, .bottom])
                
                Spacer().frame(height: 300)
                
                CustomMainButton(text: "다음", foreground: .white, background: .buttonColor)
            }
        }
    }
}
struct Register3_Previews: PreviewProvider {
    static var previews: some View {
        Register3()
    }
}
