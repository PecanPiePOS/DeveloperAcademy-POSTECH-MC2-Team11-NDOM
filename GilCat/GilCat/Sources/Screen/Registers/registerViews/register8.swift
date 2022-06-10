//
//  register8.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/10.
//

import SwiftUI
import ConfettiSwiftUI

struct Register8: View {
    @State var isLinkActive = false
    @State var timerCounter: Int = 4
    @State var effectCounter: Int = 3
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            CustomTitle(titleText: "축하드려요🎉")
            ZStack {
                Rectangle()
                    .frame(width: 130, height: 130)
                    .background(.white)
                    .blur(radius: 50.0)
                Image("cat_gray_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 130)
                    .padding()
                    .background(Color.profileBackgroundColor)
                    .cornerRadius(50)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        effectCounter -= 1
                    }
            }.padding(30)
            VStack(spacing: 15) {
                getDescribeView(title: "이름", content: "나비")
                getDescribeView(title: "성별", content: "수컷")
                getDescribeView(title: "중성화", content: "O")
                getDescribeView(title: "나이", content: "3개월")
                getDescribeView(title: "종", content: "치즈냥이")
            }
            Spacer()
            NavigationLink(destination: TagView(), isActive: $isLinkActive) {
                Button {
                    isLinkActive = true
                } label: {
                    CustomMainButton(text: "관리 시작하기", foreground: Color.white, background: .buttonColor)
                }
                .padding()
            }
        }
        .background(Color.backgroundColor)
        .confettiCannon(counter: $effectCounter)
        .onReceive(timer) { _ in
            if timerCounter > 0 && effectCounter > 0 {
                if timerCounter != 2 {
                    effectCounter -= 1
                }
                timerCounter -= 1
            }
        }
    }
    
    func getDescribeView(title: String, content: String) -> some View {
        return HStack {
            Text(title)
                .foregroundColor(.white)
                .opacity(0.7)
                .font(.system(size: 18, weight: .heavy))
            Spacer()
            Text(content)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .heavy))
        }
        .frame(width: 200)
    }
}

struct Register8_Previews: PreviewProvider {
    static var previews: some View {
        Register8()
    }
}
