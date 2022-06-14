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
                    Text("나비")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(.white)
                    
                    RoundedRectangle(cornerRadius: 21)
                        .frame(width: 74, height: 40)
                        .foregroundColor(checkTNR ? Color(.red) : Color("ButtonColor") )
                        .overlay {
                            Text(checkTNR ? "중성화X" : "중성화")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            checkTNR.toggle()
                        }
                }
                Text("3살!!")
                .bold()
                .foregroundColor(.red)
                Text("수컷!!")
                .bold()
                .foregroundColor(.red)
                Text("코리안숏헤어")
                .bold()
                .foregroundColor(.red)
            }
            .padding(.top, 30)
        }
        .frame(width: .infinity, height: 160)
    }
}

struct NoteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NoteProfileView()
    }
}
