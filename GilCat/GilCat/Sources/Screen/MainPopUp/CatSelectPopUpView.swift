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

struct DummyBG: View {
    @State var isSelected = true
    @State var catName = "Navi"
    @State var isInviting = false
    @State var inviteCode = "123456"
    @State var openDiary: Bool = false
    @State var openCode: Bool = false
    
    @State var dummyData: [Dummy] = [
        Dummy(label: "Navi", isClicked: true),
        Dummy(label: "Nero", isClicked: false)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    dummyData[0].isClicked.toggle()
                }label: {Text(dummyData[0].label)}
                
                Button {
                    dummyData[1].isClicked.toggle()
                }label: {Text(dummyData[1].label)}
            }
            
            ForEach(0..<dummyData.count, id: \.self) { index in
                
                if dummyData[index].isClicked {
                    Button {
                        dummyData[index].isClicked.toggle()
                    }label: {
                        Rectangle()
                            .foregroundColor(.clear)
                    }
                    .overlay(CatSelectPopup(dummyData: $dummyData, index: index))
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                }
            }
        }
    }
}

struct CatSelectPopup: View {
    @State var isSelected = true
    @State var isInviting = false
    @State var inviteCode = "123456"
    @State var openDiary: Bool = false
    @State var openCode: Bool = false
    
    @Binding var dummyData: [Dummy]
    var index: Int
    
    private func custumRect (width: CGFloat, height: CGFloat, cornerRadius: CGFloat) -> some View{
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: width, height: height)
    }
    
    var body: some View {
        
        ZStack {
            custumRect(width: 352, height: 303, cornerRadius: 30)
                .padding(.bottom, 20)
                .padding(.top, 521)
                .foregroundColor(.mainBlue)
            
            HStack {
                custumRect(width: 90, height: 90, cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .padding(.leading, 55)
                
                Text(dummyData[index].label)
                    .foregroundColor(Color.white)
                    .padding(.leading, 30)
                    .font(.system(size: 30, weight: .heavy))
                
                Spacer()
                
                Button {
                    dummyData[index].isClicked.toggle()
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
                    openDiary.toggle()
                } label: {
                    custumRect(width: 281, height: 60, cornerRadius: 20)
                        .foregroundColor(.mainOrange)
                        .overlay(Text("기록장")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .heavy)))
                }.fullScreenCover(isPresented: $openDiary) {
                    NoteView()
                }
                .padding(.bottom, 15)
                
                HStack {
                    Button {
                        // 초대하기 기능
                        self.isInviting = true
                    } label: {
                        custumRect(width: 130, height: 60, cornerRadius: 20)
                            .foregroundColor(.mainBlack)
                            .overlay(isInviting ? Text(inviteCode).foregroundColor(.mainOrange) : Text("초대하기")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy)))
                    }.padding(.leading, 55)
                    Spacer()
                    Button {
                        // 합치기 기능
                        openCode.toggle()
                    } label: {
                        custumRect(width: 130, height: 60, cornerRadius: 20)
                            .foregroundColor(.mainBlack)
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
        DummyBG()
    }
}
