//
//  NoteView.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/09.
//

import SwiftUI
import PartialSheet

struct NoteView: View {
    
    // Dummy Datas
    let healthList = ["피부에 문제가 있어보여요", "복부가 부었어요", "걸음걸이가 이상해보여요", "임신을 했어요", "털 상태가 좋지 못해요", "피가 나요", "토를 계속 해요"]
    let memoList = ["오늘은 달이가 다른 고양이와 싸우고 온 것 같다. 덩치도 산만한 것이 싸움도 못하나 보다. 목덜미 주변에 피가 있는데 닦아 주지를 못한다. 아직 달이와 나의 거리는 3미터 내로 좁혀지지 않는다. 상처를 치료해주지 못해 답답.", "저 저 나쁜 놈이 있다. 덩치는 달이의 반도 못하는데, 얼마나 날렵해 보이는지... 달이가 생각보다 나이가 많은가 보다. 뚜드려 맞는 장면을 봤다. 어쩐지 평소보다 사료가 더 많이 남아있더라니... 달이가 하나도 먹지 못하고 저놈시키가 몇알 뺏어먹고 말았구나..."]
    
    //    @Binding var gilCatSpecific: GilCatInfo
    @EnvironmentObject var catInfo: InfoToNote
    
    //    @Binding var hourEx: String
    @Environment(\.presentationMode) var presentation
    @State private var stickNumber = 0
    @State private var checkProfile = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackGroundColor")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        // MARK: 프로필 사진
                        Image("cat_gray_3")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .background(Color("PickerColor"))
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 43, style: .continuous))
                            .padding(.top, 10)
                        
                        // MARK: 이름
                        ZStack {
                            Image("twoLetter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80, alignment: .center)
                                .offset(y: 14)
                            
                            Text(catInfo.name)
                                .font(.system(size: 40, weight: .heavy))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 10)
                        .offset(y: -10)
                        
                        // MARK: 프로필 자세히 보기
                        RoundedRectangle(cornerRadius: 36, style: .continuous)
                            .foregroundColor(Color("ButtonColor"))
                            .frame(width: 180, height: 44, alignment: .center)
                            .overlay {
                                Text("프로필 자세히 보기")
                                    .font(.system(size: 15, weight: .heavy))
                                    .foregroundColor(.white)
                            }
                            .onTapGesture {
                                checkProfile.toggle()
                            }
                            .partialSheet(isPresented: $checkProfile,
                                          iPhoneStyle: PSIphoneStyle(background: .solid(Color("BackGroundColor")),
                                                                     handleBarStyle: .none,
                                                                     cover: .enabled(Color.black.opacity(0.5)),
                                                                     cornerRadius: 24)) {
                                NoteProfileView()
                            }
                                                                     .padding(.bottom, 30)
                        
                        // MARK: 마지막 급식급수
                        HStack(spacing: 24) {
                            NavigationLink(destination: NoteFoodView()) {
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .frame(width: 160, height: 230)
                                    .foregroundColor(Color("PickerColor").opacity(0.9))
                                    .overlay {
                                        VStack {
                                            
                                            Spacer()
                                            
                                            Text("마지막 급식")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .bold))
                                                .offset(y: 10)
                                                .padding()
                                            
                                            Image("foodBowl")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 60)
                                            
                                            Text(catInfo.dietInfo.time)
                                                .font(.system(size: 32, weight: .heavy))
                                                .foregroundColor(Color("ButtonColor"))
                                            
                                            Spacer()
                                            
                                            Text("눌러서 갱신")
                                                .font(.system(size: 14, weight: .light))
                                                .foregroundColor(.gray)
                                                .padding()
                                                .padding(.bottom, 5)
                                        }
                                    }
                            }
                            NavigationLink(destination: NoteWaterView()) {
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .frame(width: 160, height: 230)
                                    .foregroundColor(Color("PickerColor").opacity(0.9))
                                    .overlay {
                                        VStack {
                                            
                                            Spacer()
                                            
                                            Text("마지막 급수")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .bold))
                                                .offset(y: 10)
                                                .padding()
                                            
                                            Image("waterBowl")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 60)
                                            
                                            Text(catInfo.waterInfo.time)
                                                .font(.system(size: 32, weight: .heavy))
                                                .foregroundColor(Color("ButtonColor"))
                                            
                                            Spacer()
                                            
                                            Text("눌러서 갱신")
                                                .font(.system(size: 14, weight: .light))
                                                .foregroundColor(.gray)
                                                .padding()
                                                .padding(.bottom, 5)
                                            
                                        }
                                    }
                            }
                        }
                        .padding()
                        
                        // MARK: 츄르 몇개?
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: 340, height: 85)
                            .foregroundColor(Color("PickerColor").opacity(0.9))
                            .overlay {
                                HStack {
                                    Text("츄르 몇개?")
                                        .font(.system(size: 20, weight: .heavy))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.5)
                                        .padding()
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        if catInfo.snackCount == 0 {
                                            Text("터치하면 추가됩니다.\n자정에 갱신됩니다.")
                                                .font(.system(size: 16, weight: .light))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                                .padding(.horizontal, 10)
                                            
                                        } else if 0 < catInfo.snackCount && catInfo.snackCount < 6 {
                                            HStack(spacing: 5) {
                                                ForEach(0...catInfo.snackCount-1, id: \.self) { _ in
                                                    Image("stick")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 60)
                                                }
                                            }
                                            
                                        } else {
                                            HStack {
                                                Spacer()
                                                
                                                Text("\(catInfo.snackCount)개")
                                                    .font(.system(size: 24, weight: .heavy))
                                                    .foregroundColor(.red)
                                                
                                                Spacer()
                                                
                                                Text("그..그만 주세요!")
                                                    .font(.system(size: 14, weight: .heavy))
                                                    .foregroundColor(.orange)
                                            }
                                            .padding()
                                        }
                                    }
                                }
                                
                                .padding()
                            }
                            .onTapGesture {
                                catInfo.snackCount += 1
                            }
                            .padding(.bottom, 20)
                        
                        // MARK: 건강상태 섹션
                        HStack {
                            Text("건강 상태")
                                .font(.system(size: 26, weight: .heavy))
                                .foregroundColor(.white)
                                .padding()
                                .offset(x: 20)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .opacity(0.6)
                                    .padding()
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        // MARK: 건강상태 박스
                        VStack {
                            Spacer().frame(height: 24)
                            
                            ForEach(catInfo.healthTagInfo, id: \.self) { comps in
                                HStack {
                                    Text("\(comps)")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color("BackGroundColor").opacity(0.5))
                                        .cornerRadius(24)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                            }
                            Spacer().frame(height: 24)
                        }
                        .frame(width: 340)
                        .background(Color("PickerColor").opacity(0.8))
                        .cornerRadius(30)
                        .padding(.bottom, 20)
                        
                        // MARK: 개인 메모장 섹션
                        HStack {
                            Text("개인 메모장")
                                .font(.system(size: 26, weight: .heavy))
                                .foregroundColor(.white)
                                .padding()
                                .offset(x: 20)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .opacity(0.6)
                                    .padding()
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        // MARK: 개인 메모장 박스
                        HStack {
                            ForEach(memoList, id: \.self) { memo in
                                VStack(alignment: .leading) {
                                    Text("2022.6.3")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(Color("ButtonColor"))
                                    Text("15:46")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.gray)
                                    Text("\(memo)")
                                        .frame(width: 280, height: 80)
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(3)
                                }
                                .frame(width: 340, height: 180)
                                .background(Color("PickerColor").opacity(0.8))
                                .cornerRadius(30)
                                .padding(.horizontal, 10)
                            }
                        }
                        .modifier(ScrollingHStackModifier(items: memoList.count, itemWidth: 280, itemSpacing: 30))
                    }
                }
                .attachPartialSheetToRoot()
                
            }
            .navigationTitle("길고양이 기록장")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(.stack)
            // MARK: 툴바 수정
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

