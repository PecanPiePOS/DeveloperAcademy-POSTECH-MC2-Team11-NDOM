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

struct DummyMain: View {
    
    @State var isPopup: Bool = false
    @State var dummyData: [Dummy] = [
        Dummy(label: "Navi", isClicked: true),
        Dummy(label: "Nero", isClicked: false)
    ]
    
    @State var gilCatData: [GilCatInfo] = [
//        GilCatInfo(name: "Navi", age: "2", gender: .male, neutralized: true, type: "치즈", avatarColor: .gray, avatarBodyIndex: 1, isUploadedToServer: false, dietInfo: .initCat, waterInfo: .initCat, snackCount: 1, healthTagInfo: ["간땡이부음","눈이예쁨"], memoInfo: [MemoInfo(time: "6월6일", content: "안녕")])
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    isPopup.toggle()
                }label: {Text(gilCatData[0].name)}
                
            }
            
            ForEach(0..<gilCatData.count, id: \.self) { index in
                
                if isPopup {
                    Button {
                        isPopup.toggle()
                    }label: {
                        Rectangle()
                            .foregroundColor(.clear)
                    }
                    .overlay(CatSelectPopup(isPopup: $isPopup, gilCatData: $gilCatData))
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                }
            }
        }
    }
}

struct CatSelectPopup: View {
    @State var isInviting = false
    @State var inviteCode = "123456"
    @State var openNote: Bool = false
    @State var openCode: Bool = false
    var index: Int = 0
    @Binding var isPopup: Bool
    @Binding var gilCatData: [GilCatInfo]
    
    private func custumRect (width: CGFloat, height: CGFloat, cornerRadius: CGFloat, color: Color) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
    
    var body: some View {
        
        ZStack {
            custumRect(width: 352, height: 303, cornerRadius: 30, color: Color.mainBlue)
                .padding(.bottom, 20)
                .padding(.top, 521)
            
            HStack {
                custumRect(width: 90, height: 90, cornerRadius: 20, color: Color.white)
                    .padding(.leading, 55)
                
                Text(gilCatData[index].name)
                    .foregroundColor(Color.white)
                    .padding(.leading, 30)
                    .font(.system(size: 30, weight: .heavy))
                
                Spacer()
                
                Button {
                    isPopup.toggle()
                } label: {
                Image(systemName: "xmark.app.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.white)
                }
                .padding(.trailing, 60)
            }
            .padding(.bottom, 210)
            .padding(.top, 544)
            VStack {
                Button {
                    // 기록장으로 가는 기능을 여기에
                    openNote.toggle()
                } label: {
                    custumRect(width: 281, height: 60, cornerRadius: 20, color: Color.mainOrange)
                        .overlay(Text("기록장")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .heavy)))
                }.fullScreenCover(isPresented: $openNote) {
                    NoteView(gilCatSpecific: $gilCatData[index])
                }
                .padding(.bottom, 15)
                
                HStack {
                    Button {
                        // 초대하기 기능
                        self.isInviting = true
                    } label: {
                        custumRect(width: 130, height: 60, cornerRadius: 20, color: Color.mainBlack)
                            .overlay(isInviting ? Text(inviteCode).foregroundColor(.mainOrange) : Text("초대하기")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy)))
                    }.padding(.leading, 55)
                    Spacer()
                    Button {
                        // 합치기 기능
                        openCode.toggle()
                    } label: {
                        custumRect(width: 130, height: 60, cornerRadius: 20, color: Color.mainBlack)
                            .overlay(Text("합치기")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy)))
                    }
                    .fullScreenCover(isPresented: $openCode) {
                        CodeView()
                    }
                    .padding(.trailing, 55)
                }
            }.padding(.top, 600)
        }.padding(.bottom, 45)
    }
}

struct CatSelectPopup_Previews: PreviewProvider {
    static var previews: some View {
        DummyMain()
    }
}
