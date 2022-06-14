//
//  NoteFoodEditView.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/13.
//

import SwiftUI

struct NoteFoodEditView: View {
    
    enum FocusField1: Hashable {
        case field
    }
    
    @Environment(\.presentationMode) var presentation
    @State private var foodChange = ""
    @FocusState private var focusField: FocusField1?
    
    init() {
        Theme.navigationBarColors(background: .systemFill, titleColor: .white)
    }
    
    var body: some View {
    
        ZStack {
            Color("BackGroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("※ 사료 이름과 시간을 선택해서 수정해주세요.")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.top, 15)

                HStack {
                    ZStack {
                        Image("fourLetter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 80, alignment: .center)
                            .offset(y: 14)
                            
                        Text("급식사료")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.white)
                    }
                    .offset(y: -10)
                    .padding(.bottom, -10)
                    .padding(.horizontal, 50)
                    .padding(.top, 40)
                    
                    Spacer()
                }
                
                TextField("", text: $foodChange)
                    .focused($focusField, equals: .field)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.focusField = .field }
                    }
                    .modifier(PlaceholderStyle(showPlaceHolder: foodChange.isEmpty, placeholder: "오늘 준 사료를 입력해 주세요!"))
                    .foregroundColor(Color.white.opacity(0.7))
                    .font(.system(size: 20, weight: .medium))
                    .disableAutocorrection(true)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                Button {
                    // 1. 선택된 값 받아오기
                    
                    // 2. 빠져나가기
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/12, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("ButtonColor"))
                        .overlay {
                            Text("수정 완료")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10)
                }
            }
        }
        .navigationTitle("급식사료 수정")
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
            }
        }
    }
}

struct NoteFoodEditView_Previews: PreviewProvider {
    static var previews: some View {
        NoteFoodEditView()
    }
}
