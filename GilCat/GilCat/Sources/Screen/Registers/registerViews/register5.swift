//
//  register5.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/08.
//

import SwiftUI

struct Register5: View {
    var body: some View {
        ZStack{
        Color.backgroundColor.ignoresSafeArea()
        
            VStack {
                HStack {
                    CustomTitle(titleText: "나이").padding([.top, .leading])
                    Spacer()
                }
                CustomTextField(placeHolder: "나비는 몇 살인가요?").padding([.leading, .bottom]).keyboardType(.numberPad)
                	
                Spacer().frame(height: 300)
                
                HStack {
                    CustomMainButton(text: "다음", foreground: .white, background: .buttonColor)
                }
            }
        }
    }
}

struct Register5_Previews: PreviewProvider {
    static var previews: some View {
        Register5()
    }
}
