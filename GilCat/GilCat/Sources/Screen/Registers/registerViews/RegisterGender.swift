import SwiftUI

struct RegisterGender: View {
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: GilCatInfoList
    @State var genderChoice: GilCatPicker.Choice = .first
    @State var TNRChoice: GilCatPicker.Choice = .first
    let genderFirstChoice = "암컷"
    let genderSecondChoice = "수컷"
    let TNRFirstChoice = "❌"
    let TNRSecondChoice = "⭕️"
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                // 성별 피커
                HStack {
                    GilCatTitle(titleText: "성별").padding([.top, .leading])
                    Spacer()
                }
                GilCatPicker(isClick: $genderChoice, firstSelect: genderFirstChoice, secondSelect: genderSecondChoice)
                // 중성화 여부 피커
                HStack {
                    GilCatTitle(titleText: "중성화 여부").padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                    Spacer()
                }
                GilCatPicker(isClick: $TNRChoice, firstSelect: TNRFirstChoice, secondSelect: TNRSecondChoice)
                
                Spacer()
                NavigationLink(destination: RegisterAge(), isActive: $isLinkActive) {
                    Button {
                        // 어떤게 클릭됐는지에 따라 값 줘야함
                        if genderChoice == .first {
                            catInfo.infoList[catInfo.infoList.endIndex-1].gender = genderFirstChoice
                        } else {
                            catInfo.infoList[catInfo.infoList.endIndex-1].gender = genderSecondChoice
                        }
                        if TNRChoice == .first {
                            catInfo.infoList[catInfo.infoList.endIndex-1].neutralized = TNRFirstChoice
                        } else {
                            catInfo.infoList[catInfo.infoList.endIndex-1].neutralized = TNRSecondChoice
                        }
                        isLinkActive = true
                    } label: {
                        GilCatMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("성별 및 중성화", displayMode: .inline)
        .onAppear {
            // 뒤로가기로 돌아왔다면 기존에 입력했던 정보를 받아오기
            if !catInfo.infoList[catInfo.infoList.endIndex-1].isUploadedToServer {
                if catInfo.infoList[catInfo.infoList.endIndex-1].gender != nil {
                    if genderFirstChoice == catInfo.infoList[catInfo.infoList.endIndex-1].gender! {
                        genderChoice = .first
                    } else {
                        genderChoice = .second
                    }
                }
                if catInfo.infoList[catInfo.infoList.endIndex-1].neutralized != nil {
                    if TNRFirstChoice == catInfo.infoList[catInfo.infoList.endIndex-1].neutralized! {
                        TNRChoice = .first
                    } else {
                        TNRChoice = .second
                    }
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
