//
//  register8.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct Register7: View {
    let gridSpace: CGFloat = 20
    @State var isLinkActive = false
    @State var selectedCatColor = CatColor.gray
    @State var selectedImageIndex = 0
    @State var catInfo: CatInfo

    init(_ catInfo: CatInfo) {
        UIScrollView.appearance().bounces = false
        self.catInfo = catInfo
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTitle(titleText: "캐릭터")
            Image(selectedCatColor.group[selectedImageIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .padding()
                .background(Color.profileBackgroundColor)
                .cornerRadius(50)
                .frame(maxWidth: .infinity)
            
            // 피커에 따라 getColorSelectView, getBodySelectView 이 둘중에 나오게 하면 될듯
            getColorSelectView()
            
            Spacer()
            NavigationLink(destination: Register8(catInfo), isActive: $isLinkActive) {
                Button {
                    catInfo.imageName = selectedCatColor.group[selectedImageIndex]
                    isLinkActive = true
                } label: {
                    CustomMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
                }
                .padding()
            }
        }
        .background(Color.backgroundColor)
    }
    
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
        Register7(CatInfo())
    }
}
