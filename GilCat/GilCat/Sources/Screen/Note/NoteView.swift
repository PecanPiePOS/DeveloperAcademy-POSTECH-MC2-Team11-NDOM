//
//  NoteView.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/09.
//

import SwiftUI
import PartialSheet

struct NoteView: View {
   
    @EnvironmentObject var catInfo: InfoToNote
    @Environment(\.presentationMode) var presentation
    @State private var checkProfile = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackGroundColor")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        // MARK: 프로필 사진
                        getCatImage(Image: catInfo.imageName)
                        
                        // MARK: 이름
                        GilCatTitle(titleText: catInfo.name)
                        
                        // MARK: 프로필 자세히 보기
                        getProfileView()
                        
                        // MARK: 마지막 급식급수
                        HStack(spacing: 24) {
                            NavigationLink(destination: NoteFoodView()) {
                                foodWaterPanelView(text: "마지막 급식", Image: "foodBowl", time: catInfo.dietInfo.time)
                            }
                            NavigationLink(destination: NoteWaterView()) {
                                foodWaterPanelView(text: "마지막 급수", Image: "waterBowl", time: catInfo.waterInfo.time)
                            }
                        }
                        .padding()
                        
                        // MARK: 츄르 몇개?
                        getSnapCountView()
                        
                        // MARK: 건강 상태
                        VStack {
                            // MARK: 건강상태 섹션
                            sectionHealthView()
                            // MARK: 건강상태 박스
                            healthBoxView()
                        }
                        
                        // MARK: 메모 박스
                        VStack {
                            // MARK: 개인 메모장 섹션
                            sectionMemoView()
                            // MARK: 개인 메모장 박스
                            memoBoxView()
                        }
                    }
                }
            }
            .attachPartialSheetToRoot()
            .navigationTitle("길고양이 기록장")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(.stack)
            // MARK: 툴바 수정
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(systemName: "chevron.backward")
                        .frame(width: 50, height: 40, alignment: .leading)
                        .foregroundColor(.white)
//                        .padding()
                        .onTapGesture {
                            self.presentation.wrappedValue.dismiss()
                        }
                }
                
            }
        }
    }

    // 정리
    @ViewBuilder
    private func getSnapCountView() -> some View {
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
    }
    
    @ViewBuilder
    private func getCatImage(Image catImage: String) -> some View {
        Image(catImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: 100, height: 100)
            .background(Color("PickerColor"))
            .clipShape(RoundedRectangle(cornerRadius: 43, style: .continuous))
            .padding(.top, 10)
    }
    
    @ViewBuilder
    private func getProfileView() -> some View {
        RoundedRectangle(cornerRadius: 36, style: .continuous)
            .foregroundColor(Color("ButtonColor"))
            .frame(width: 180, height: 44, alignment: .center)
            .overlay {
                Text("프로필 자세히 보기")
                    .font(.system(size: 15, weight: .heavy))
                    .foregroundColor(.white)
            }
            .onTapGesture {
                self.checkProfile.toggle()
            }
            .partialSheet(isPresented: $checkProfile,
                          iPhoneStyle: PSIphoneStyle(background: .solid(Color("BackGroundColor")),
                                                     handleBarStyle: .none,
                                                     cover: .enabled(Color.black.opacity(0.5)),
                                                     cornerRadius: 24)) {
                NoteProfileView()
            }
            .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private func sectionHealthView() -> some View {
        HStack {
            Text("건강 상태")
                .font(.system(size: 26, weight: .heavy))
                .foregroundColor(.white)
                .padding()
                .offset(x: 20)
            Spacer()
            NavigationLink(destination: HealthTagShow(tags: $catInfo.healthTagInfo)) {
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
    }
    
    @ViewBuilder
    private func sectionMemoView() -> some View {
        HStack {
            Text("개인 메모장")
                .font(.system(size: 26, weight: .heavy))
                .foregroundColor(.white)
                .padding()
                .offset(x: 20)
            
            Spacer()
            
            NavigationLink(destination: NoteMemoWriteView()) {
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
    }
    
    @ViewBuilder
    private func healthBoxView() -> some View {
        VStack {
            Spacer().frame(height: 24)
            ForEach(catInfo.healthTagInfo, id: \.self) { comps in
                if comps.isClicked {
                    HStack {
                        Text("\(comps.text)")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("ButtonColor").opacity(0.8))
                            .cornerRadius(24)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                }
            }
            Spacer().frame(height: 24)
        }
        .frame(width: 340)
        .background(Color("PickerColor").opacity(0.9))
        .cornerRadius(30)
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private func memoBoxView() -> some View {
        ZStack {
            HStack {
                ForEach(catInfo.memoInfo, id: \.self) { memo in
                    VStack(alignment: .leading) {
                        Text(memo.date)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("ButtonColor"))
                        Text(memo.time)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                        Text(memo.content)
                            .frame(width: 280, height: 80)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                    }
                    .frame(width: 340, height: 180)
                    .background(Color("PickerColor").opacity(0.9))
                    .cornerRadius(30)
                    .padding(.horizontal, 10)
                }
            }
            .modifier(ScrollingHStackModifier(items: catInfo.memoInfo.count + 1, itemWidth: 280, itemSpacing: 88))
            
            if catInfo.memoInfo.isEmpty {
                Rectangle()
                    .frame(width: 340, height: 50)
                    .background(Color.pickerColor.opacity(0.9))
                    .cornerRadius(30)
            }
        }
    }
    
    @ViewBuilder
    private func foodWaterPanelView(text textPanel: String, Image image: String, time timetext: String ) -> some View {
        NavigationLink(destination: NoteFoodView()) {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 160, height: 230)
                .foregroundColor(Color("PickerColor").opacity(0.9))
                .overlay {
                    VStack {
                        Spacer()
                        Text(textPanel)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .offset(y: 10)
                            .padding()
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        Text(timetext)
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
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
            .environmentObject(InfoToNote())
    }
}
