//
//  NoteProfileView.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/12.
//

import SwiftUI

struct NoteProfileView: View {
    @State private var checkTNR = false
    
    var body: some View {
        ZStack {
            Color("BackGroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                HStack(spacing: 20) {
                    getCatNameView(Text: "나비이")
                    
                    getTNRInfoView(TNR: checkTNR)
                    
                }
                textProfileView(Text: "3짤")
                textProfileView(Text: "남컷")
                textProfileView(Text: "코숏")
            }
            .padding(.top, 30)
        }
        .frame(width: .infinity, height: 160)
    }
    
    // MARK: 고양이 이름 표시
    @ViewBuilder
    private func getCatNameView(Text text: String) -> some View {
        Text(text)
            .font(.system(size: 30, weight: .heavy))
            .foregroundColor(.white)
    }
    
    // MARK: TNR 정보 표시
    @ViewBuilder
    private func getTNRInfoView(TNR checkTNR: Bool) -> some View {
        RoundedRectangle(cornerRadius: 21)
            .frame(width: 74, height: 40)
            .foregroundColor(checkTNR ? Color(.red) : Color("ButtonColor") )
            .overlay {
                Text(checkTNR ? "중성화X" : "중성화")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
            }
    }
    
    // MARK: 프로필 상세 내용
    @ViewBuilder
    private func textProfileView(Text text: String) -> some View {
        Text(text)
            .bold()
            .font(.title3)
    }
}

struct NoteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NoteProfileView()
    }
}
