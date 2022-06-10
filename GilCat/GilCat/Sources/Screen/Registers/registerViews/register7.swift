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
    
    init() {
        UIScrollView.appearance().bounces = false
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
            
            getColorSelectView()
            
            Spacer()
            NavigationLink(destination: Register8(), isActive: $isLinkActive) {
                Button {
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
