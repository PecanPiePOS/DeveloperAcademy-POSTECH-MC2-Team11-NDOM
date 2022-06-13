//
//  LoginView.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/09.
//

import SwiftUI

struct LoginView: View {
    
    @State private var nickName = ""
    @State private var checkName = false
    @State private var checkNetwork = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackGroundColor")
                    .edgesIgnoringSafeArea(.all
                    )
                VStack(alignment: .leading) {
                    Spacer()
                    
                    TextField("", text: $nickName)
                        .modifier(PlaceholderStyle(showPlaceHolder: nickName.isEmpty, placeholder: "원하는 닉네임을 정해주세요!"))
                        .foregroundColor(Color.white)
                        .font(.system(size: 22, weight: .heavy))
                        .disableAutocorrection(true)
                        .padding(.horizontal, 40)
                    
                    if checkNetwork && checkName {
                        Text("중복된 이름입니다.")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(.red.opacity(0.7))
                            .padding(.horizontal, 60)
                    } else if !checkNetwork {
                        Text("네트워크를 확인해 주세요.")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(.red.opacity(0.7))
                            .padding(.horizontal, 60)
                    } else {
                        Text("닉네임은 2~8글자로 적어주세요.")
                        .font(.system(size: 13, weight: .light))
                        .foregroundColor((nickName.count > 8) ? .red : .green)
                        .opacity(0.8)
                        .padding(.horizontal, 60)
                    }
                        
                    Spacer()
                    
                    NavigationLink(destination: NoteView()) {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/12, alignment: .center)
                            .cornerRadius(20)
                            .foregroundColor(Color("ButtonColor"))
                            .overlay {
                                Text("다음")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 10)
                    }
                    .disabled(!checkNetwork || checkName || nickName.count > 8 || nickName.count < 2)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
