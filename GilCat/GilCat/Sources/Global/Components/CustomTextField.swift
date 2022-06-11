import SwiftUI

struct CustomTextField: View {
    @Binding var inputText: String
    @State var placeHolder: String = ""
    
    // PlaceHolder가 있는 입력 칸을 보여주기 위한 뷰
    private func customTextField() -> some View {
        return ZStack {
            // 아무것도 안써져 있을 경우 Placeholder 보여주기
            if inputText.isEmpty {
                HStack {
                    Text("\(placeHolder)").foregroundColor(.gray).padding()
                Spacer()
                }
            }
            TextField("", text: $inputText).padding()
        }
    }

    var body: some View {
        customTextField()
    }
}
