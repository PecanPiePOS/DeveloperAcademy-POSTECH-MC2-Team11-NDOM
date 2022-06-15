//
//  NoteWaterView.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/12.
//

import SwiftUI

struct NoteWaterView: View {
    
    @State private var waterless = false
    @State private var watermid = true
    @State private var waterfull = false
    @Environment(\.presentationMode) var presentation

    init() {
        Theme.navigationBarColors(background: .systemFill, titleColor: .white)
    }
    
    var body: some View {
        ZStack {
            Color("BackGroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("※ 시간을 선택해서 수정해주세요.")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.top, 15)
                
                Spacer()
                
                HStack(alignment: .lastTextBaseline, spacing: 15) {
                    Text("물")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(.white)
                        .frame(width: 240, height: 100)
                
                }
                
                Image("waterBowl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/6)
                
                // custom picker View
                GilCatTimePicker()
                
                HStack(spacing: 15) {

                    Text("25%")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .frame(width: 70, height: 70, alignment: .center)
                        .overlay {
                            if !waterless {
                                RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray, lineWidth: 6)
                                            .frame(width: 90, height: 90)
                            } else {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color("ButtonColor"))
                                
                                Text("25%")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(.white)
                            }
                        }

                        .onTapGesture {
                            waterless = true
                            watermid = false
                            waterfull = false
                        }
                        .padding()
                    
                    Text("50%")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .frame(width: 70, height: 70, alignment: .center)
                        .overlay {
                            if !watermid {
                                RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray, lineWidth: 6)
                                            .frame(width: 90, height: 90)
                            } else {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color("ButtonColor"))
                                
                                Text("50%")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(.white)
                            }
                        }
                        .onTapGesture {
                            waterless = false
                            watermid = true
                            waterfull = false
                        }
                        .padding()
                    
                    Text("100%")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .frame(width: 70, height: 70, alignment: .center)
                        .overlay {
                            if !waterfull {
                                RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray, lineWidth: 6)
                                            .frame(width: 90, height: 90)
                            } else {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color("ButtonColor"))
                                
                                Text("100%")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(.white)
                            }
                        }
                        .onTapGesture {
                            waterless = false
                            watermid = false
                            waterfull = true
                        }
                        .padding()
                }
                .padding()
                
                Spacer()
                
                Button {
                    // 1. 선택된 값 받아오기 서버에 시간 및
                    // 2. 빠져나가기
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/12, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("ButtonColor"))
                        .overlay {
                            Text("등록 완료")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10)
                }
                
            }
            .navigationTitle("급식 입력")
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
}

struct NoteWaterView_Previews: PreviewProvider {
    static var previews: some View {
        NoteWaterView()
    }
}
