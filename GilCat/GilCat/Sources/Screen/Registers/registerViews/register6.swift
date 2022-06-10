//
//  register6.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct Register6: View {
    var body: some View {
        ZStack{
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    CustomTitle(titleText: "종").padding()
                    Spacer()
                }
                CustomTextField(placeHolder: "고양이 종을 아신다면 알려주세요. ").padding()
                
                Spacer().frame(height: 300)
                
                HStack {
                    //여기도 navigationLink로 버튼 처럼 만들어야 할듯
                    CustomButton()
                }
            }
        }
    }
}

struct Register6_Previews: PreviewProvider {
    static var previews: some View {
        Register6()
    }
}
