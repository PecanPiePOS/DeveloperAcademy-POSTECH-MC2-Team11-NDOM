import SwiftUI

struct Register7: View {
    let gridSpace: CGFloat = 20
    @State var isLinkActive = false
    @State var selectedCatColor = CatColor.gray
    @State var selectedImageIndex = 0
    @State var selectedView: String = "외형"
    @EnvironmentObject var catInfo: CatInfoList
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // 제목
            CustomTitle(titleText: "캐릭터")
            // 커스텀한 아바타
            Image(selectedCatColor.group[selectedImageIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .padding()
                .background(Color.profileBackgroundColor)
                .cornerRadius(50)
                .frame(maxWidth: .infinity)
            // 색과 외형 중 고를 수 있는 피커
            CustomPicker(firstSelect: "색", secondSelect: "외형", selected: $selectedView)
            // 피커에 따라 보여지는 커스텀 칸
            if selectedView == "외형"{
                getBodySelectView()
            } else {
                getColorSelectView()
            }
            Spacer()
            // 메인 버튼
            NavigationLink(destination: Register8(), isActive: $isLinkActive) {
                Button {
                    // 커스텀해서 선택된 이미지 이름 저장하기
                    catInfo.infoList[catInfo.infoList.endIndex-1].imageName = selectedCatColor.group[selectedImageIndex]
                    isLinkActive = true
                } label: {
                    CustomMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
                }
                .padding()
            }
        }
        .background(Color.backgroundColor)
    }
    
    // 몸체를 선택할 때 반복되는 이미지에 대한 뷰를 반환
    func getImageView(_ index: Int) -> some View {
        return Image(selectedCatColor.group[index])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(selectedImageIndex == index ? .red : .blue, lineWidth: 4)
            )
            .onTapGesture {
                selectedImageIndex = index
            }
    }
    
    // 몸체 선택하는 창 나오게 하기
    func getBodySelectView() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: gridSpace) {
                ForEach(0..<selectedCatColor.group.count/2, id: \.self) { index in
                    VStack(spacing: gridSpace) {
                        getImageView(2*index)
                        getImageView(2*index+1)
                    }
                }
            }
            .padding()
            .background(Color.pickerColor)
        }
        
    }
    
    // 색깔을 선택할 때 반복되는 도형에 대한 뷰를 반환
    func getColorView(_ catColor: CatColor) -> some View {
        return Circle()
            .fill(catColor.color)
            .frame(width: 70, height: 70)
            .onTapGesture {
                selectedCatColor = catColor
            }
            
    }
    
    // 색깔 선택하는 창 나오게 하기
    func getColorSelectView() -> some View {
        return HStack(spacing: gridSpace) {
            ForEach(0..<CatColor.allCases.count/3, id: \.self) { index in
                VStack(spacing: gridSpace) {
                    getColorView(CatColor.allCases[3*index])
                    getColorView(CatColor.allCases[3*index+1])
                    getColorView(CatColor.allCases[3*index+2])
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.pickerColor)
    }
}

struct Register7_Previews: PreviewProvider {
    static var previews: some View {
        Register7()
    }
}
