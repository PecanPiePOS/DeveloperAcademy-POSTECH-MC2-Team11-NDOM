import SwiftUI

struct RegisterGender: View {
    @State var isClick: Bool = false
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: GilCatInfoList
    @State var selectedGender: String = "암컷"
    @State var selectedTNR: String = "❌"
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                HStack {
                    GilCatTitle(titleText: "성별").padding([.top, .leading])
                    Spacer()
                }

                GilCatPicker(firstSelect: "수컷", secondSelect: "암컷", selected: $selectedGender)
                // picker로 select된 값들 저장하게 만들어야함
                HStack {
                    GilCatTitle(titleText: "중성화 여부").padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                    Spacer()
                }
                
                GilCatPicker(firstSelect: "⭕️", secondSelect: "❌", selected: $selectedTNR)
                
                Spacer()
                NavigationLink(destination: RegisterAge(), isActive: $isLinkActive) {
                    Button {
                        // 어떤게 클릭됐는지에 따라 값 줘야함 (지금은 그냥 임시로 넣어놓음)
                        catInfo.infoList[catInfo.infoList.endIndex-1].gender = selectedGender
                        catInfo.infoList[catInfo.infoList.endIndex-1].neutralized = selectedTNR
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
struct RegisterGender_Previews: PreviewProvider {
    static var previews: some View {
        RegisterGender()
    }
}

// ZStack {
//    Rectangle().frame(width: 200, height: 50).cornerRadius(20).foregroundColor(.white).offset(x: isClick ? 100 : -100).onTapGesture {
//        //하얀색과 배경이 같이 클릭될 시 안 움직이게 하는 방법
//    }
//    HStack {
//        Text(male).offset(x: -70).foregroundColor(isClick ? .white : .buttonColor)
//        Text(female).offset(x: 70).foregroundColor(isClick ? .buttonColor : .white)
//    }//클릭시 좌표값에 따라 도형이 안움직이게 해야함
// }.frame(width: 350, height: 50).background(Color.pickerColor).cornerRadius(20).onTapGesture {
//        withAnimation {
//        isClick.toggle()
//        }
//    }
