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
    @EnvironmentObject var catInfo : CatInfoList
    
    var body: some View {
        VStack {
            CustomTitle(titleText: "축하드려요🎉")
            ZStack {
                Rectangle()
                    .frame(width: 130, height: 130)
                    .background(.white)
                    .blur(radius: 50.0)
                Image(catInfo.infoList[catInfo.infoList.endIndex-1].imageName!)
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
                getDescribeView(title: "이름", index: 0)
                getDescribeView(title: "성별", index: 1)
                getDescribeView(title: "중성화", index: 2)
                getDescribeView(title: "나이", index: 3)
                getDescribeView(title: "종", index: 4)
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
    
    func getDescribeView(title: String, index: Int) -> some View {
        var content = "-"
        switch index {
        case 0:
            if let name = catInfo.infoList[catInfo.infoList.endIndex-1].name {
                if !name.isEmpty {
                    content = name
                }
            }
        case 1:
            if let gender = catInfo.infoList[catInfo.infoList.endIndex-1].gender {
                content = gender
            }
        case 2:
            if let neutralized = catInfo.infoList[catInfo.infoList.endIndex-1].neutralized {
                content = neutralized
            }
        case 3:
            if let age = catInfo.infoList[catInfo.infoList.endIndex-1].age {
                if !age.isEmpty {
                    content = age
                }
            }
        case 4:
            if let type = catInfo.infoList[catInfo.infoList.endIndex-1].type {
                if !type.isEmpty {
                    content = type
                }
            }
        default:
            content = "-"
        }
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
