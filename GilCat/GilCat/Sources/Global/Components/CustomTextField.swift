import SwiftUI

struct CustomTextField: View {
    @Binding var inputText: String
    @State var placeHolder: String = ""
    
    private func customTextField() -> some View {
        return ZStack {
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
