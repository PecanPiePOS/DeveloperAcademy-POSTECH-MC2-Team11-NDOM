//
//  register1.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/07.
//

import SwiftUI

struct Register1: View {
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: CatInfoList
    var body: some View {
        // Todo: 현재는 네비게이션뷰로 다른 뷰들을 연결했지만 괜찮은 애니메이션 전환 요소를 찾으면 바꿀 예정입니다.
        NavigationView {
            VStack(alignment: .leading) {
                // 제목
                CustomTitle(titleText: "나만의 길고양이 기록장을 만들어보세요!")
                // 목차
                VStack {
                    getProcessContentView(order: 1, text: "공유 코드가 있다면 알려주세요!")
                    getProcessContentView(order: 2, text: "길냥이 프로필을 적아주세요!")
                    getProcessContentView(order: 3, text: "나만의 길냥이를 만들어주세요!")
                }
                .padding()
                Spacer()
                // 메인 버튼
                NavigationLink(destination: Register2(), isActive: $isLinkActive) {
                    Button {
                        isLinkActive = true
                        // 고양이 정보를 저장하는 새로운 객체 생성
                        catInfo.infoList.append(CatInfo())
                    } label: {
                        CustomMainButton(text: "시작하기", foreground: Color.white, background: .buttonColor)
                    }
                    .padding()
                }
            }
            .background(Color.backgroundColor)
        }
    }
    
    // 목차 뷰 반환하기
    func getProcessContentView(order: Int, text: String) -> some View {
        return HStack {
            Text(String(order))
                .frame(width: 30, height: 30)
                .foregroundColor(Color.black)
                .background(Color.buttonColor)
                .cornerRadius(10)
            Text(text)
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.pickerColor)
        .cornerRadius(20)
    }
}

struct Register1_Previews: PreviewProvider {
    static var previews: some View {
        Register1()
    }
}
