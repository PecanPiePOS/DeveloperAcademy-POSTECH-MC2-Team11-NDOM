import SwiftUI

// PlaceHolder가 있는 입력 칸을 보여주기 위한 뷰
struct GilCatTextField: View {
    @Binding var inputText: String
    @State var placeHolder: String = ""
    @State var textLimit: Int
    /*
     사용방법:
     
        GilCatTextField(inputText: 입력되는 텍스트 값 , placeHolder: String 값으로 PlaceHolder로 보여줄 텍스트, textLimit: 글자수 제한하는 정도)
     
     */
    
    private func customTextField(textLimit: Int) -> some View {
        return ZStack {
            // 아무것도 안써져 있을 경우 Placeholder 보여주기
            if inputText.isEmpty {
                HStack {
                    Text("\(placeHolder)").foregroundColor(.gray).lineLimit(1).padding()
                Spacer()
                }
            }
            TextField("", text: $inputText).foregroundColor(.white).padding()
                .onChange(of: inputText) { _ in
                    if inputText.count > textLimit {
                        inputText = String(inputText.prefix(textLimit))
                        // 8글자 제한으로 종 입력시 placeHolder 줄바꿈 및 입력 커서 안맞는 현상 해결!🤩
                    }
                }
        }
    }

    var body: some View {
        customTextField(textLimit: textLimit)
    }
}
