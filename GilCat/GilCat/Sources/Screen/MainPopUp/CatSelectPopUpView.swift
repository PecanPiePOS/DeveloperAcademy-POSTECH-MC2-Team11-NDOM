//
//  CatSelect_Popup.swift
//  GilCat
//
//  Created by Beone on 2022/06/08.
//

import SwiftUI

struct Dummy: Identifiable {
    var id = UUID()
    var label: String
    var isClicked: Bool
}

struct CatSelectPopup: View {
    static let cardWidth: CGFloat = 352
    static let cardHeight: CGFloat = 303
    
    @State var isInviting = false
    @State var inviteCode = "123456"
    @State var openNote: Bool = false
    @State var openCode: Bool = false

    @Binding var isPopup: Bool
    @Binding var cat: GilCatInfo
    
    @ViewBuilder
    private func custumRadiusRect (
        width: CGFloat,
        height: CGFloat,
        cornerRadius: CGFloat,
        color: Color
    ) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    isPopup = false
                }
            } label: {
                Color.clear
            }
            ZStack {
                VStack {
                    HStack(alignment: .center, spacing: 26) {
                            Color.mainBlack
                                .frame(width: 90, height: 90, alignment: .center)
                                .cornerRadius(19)
                        
                        Text(cat.name)
                            .foregroundColor(Color.white)
                            .font(.system(size: 30, weight: .heavy))
                        Spacer()
                        
                        VStack {
                            Button {
                                isPopup = false
                            } label: {
                                Image(systemName: "xmark.app.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.white)
                            }
                            .padding(.bottom, 70)
                        }
                    }
                    .frame(width: 281, height: 70, alignment: .center)
                    .padding([.leading, .trailing], 30)
                    .padding([.top], 30)
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .center, spacing: 16) {
                        Button {
                            // 기록장으로 가는 기능을 여기에
                            openNote.toggle()
                        } label: {
                            Color.mainOrange
                                .frame(width: 281, height: 60)
                                .cornerRadius(20)
                                .overlay(Text("기록장")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .heavy)))
                        }
                        .fullScreenCover(isPresented: $openNote) {
                            NoteView(gilCatSpecific: $cat)
                        }
                        
                        HStack(alignment: .center, spacing: 16) {
                            Button {
                                // 초대하기 기능
                                self.isInviting = true
                            } label: {
                                Color.mainBlack
                                    .frame(width: 130, height: 60, alignment: .center)
                                    .cornerRadius(20)
                                    .overlay(isInviting ? Text(inviteCode).foregroundColor(.mainOrange) : Text("초대하기").foregroundColor(.white).font(.system(size: 20, weight: .heavy)))
                            }
                            Button {
                                // 합치기 기능
                                openCode.toggle()
                            } label: {
                                Color.mainBlack
                                    .frame(width: 130, height: 60, alignment: .center)
                                    .cornerRadius(20)
                                    .overlay(Text("합치기").foregroundColor(.white).font(.system(size: 20, weight: .heavy)))
                            }
                            .fullScreenCover(isPresented: $openCode) {
                                CodeView()
                            }
                        }
                        
                    }
                    .padding(.bottom, 20)
                }
            }
            .background(Color.mainBlue)
            .cornerRadius(30)
            .padding([.leading, .trailing], 16)
        }
    }
}

struct CatSelectPopup_Previews: PreviewProvider {
    static var previews: some View {
        CatSelectPopup(isPopup: .constant(true), cat: .constant(GilCatInfo.empty))
    }
}
