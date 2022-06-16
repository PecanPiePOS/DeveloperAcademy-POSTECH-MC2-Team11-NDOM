//
//  NoteTagEditView.swift
//  GilCat
//
//  Created by 김동락 on 2022/06/15.
//

import SwiftUI
import CoreGraphics

struct HealthTagShow: View {
    @State var temp = false
    @State var isModalPresented = false
    @State var newTagText = ""
    @Binding var tags: [HealthTag]
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack(alignment: .leading) {
            // 부가 설명
            CustomSubTitle(text: "※ 해당되는 건강 태그를 선택해주세요.")
            // 제목
            HStack(alignment: .firstTextBaseline) {
                VStack {
                    GilCatTitle(titleText: "건강")
                }
                
                Spacer()
                
                // 추가 버튼
                Button {
                    isModalPresented = true
                } label: {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "plus")
                            .padding()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.buttonColor)
                            .background(Color.profileBackgroundColor)
                            .font(.system(size: 25, weight: Font.Weight.heavy))
                            .cornerRadius(20)
                            .padding(.leading, 4)
                    }
                }
            }
            
            Text("✓ 한번 더 누르면 활성화되어 기록장에 추가됩니다.")
                .font(.caption)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.top, -10)
                .padding(.bottom)
            
            // 태그 보여주는 칸
            ScrollView {
                TagCloud(tags: $tags)
            }
            Spacer()
            // 메인 버튼
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                GilCatMainButton(text: "등록 완료", foreground: .white, background: .constant(.buttonColor))
            }

        }
        .padding()
        .background(Color.backgroundColor)
        .sheet(isPresented: $isModalPresented) {
            WriteTagView(newTagText: $newTagText, isModalPresented: $isModalPresented, tags: $tags)
        }
    }
}

// 태그를 새로 추가할 떄 모달창으로 나타나는 뷰
struct WriteTagView: View {
    @Binding var newTagText: String
    @Binding var isModalPresented: Bool
    @Binding var tags: [HealthTag]
    @FocusState var isModalFocused: Bool?
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    newTagText = ""
                    isModalPresented = false
                } label: {
                    Text("닫기")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: Font.Weight.heavy))
                }
            }
            GilCatTextField(inputText: $newTagText, placeHolder: "태그를 추가하세요.", textLimit: 8)
                .focused($isModalFocused, equals: true)
            Spacer()
            Button {
                tags.append(HealthTag(newTagText))
                newTagText = ""
                isModalPresented = false
            } label: {
                GilCatMainButton(text: "태그 추가", foreground: .white, background: .constant(.buttonColor))
            }
        }
        .padding()
        .background(Color.backgroundColor)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isModalFocused = true
            }
        }
    }
}

struct TagCloud: View {
    @Binding var tags: [HealthTag]
    @State private var totalHeight = CGFloat.infinity

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(maxHeight: .infinity)
    }

    private func generateContent(in geoProxy: GeometryProxy) -> some View {
        var width = 0
        var height = 0

        return ZStack(alignment: .topLeading) {
            ForEach(0..<self.tags.count, id: \.self) { idx in
                self.item(for: idx)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { val in
                        if abs(CGFloat(width) - val.width) > geoProxy.size.width {
                            width = 0
                            height -= Int(val.height)
                        }
                        let result = width
                        if tags[idx] == self.tags.last! {
                            width = 0
                        } else {
                            width -= Int(val.width)
                        }
                        return CGFloat(result)
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if tags[idx] == self.tags.last! {
                            height = 0
                        }
                        return CGFloat(result)
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for idx: Int) -> some View {
        ZStack(alignment: .trailing) {
            Button {
                tags[idx].isClicked.toggle()
            } label: {
                Text(tags[idx].text)
                    .padding()
                    .padding(.trailing, 16)
                    .foregroundColor(.white)
                    .background(tags[idx].isClicked ? Color.buttonColor : Color.profileBackgroundColor)
                    .font(.system(size: 15, weight: Font.Weight.heavy))
                    .cornerRadius(20)
            }
            Image(systemName: "x.circle.fill")
                .foregroundColor(Color.white)
                .padding(.trailing, 8)
                .onTapGesture {
                    tags.remove(at: idx)
                }
        }
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

// 사용 예시
struct TagViewTest: View {
    @State var customtags = [
        HealthTag("피부에 문제가 있어요"),
        HealthTag("기운이 없어요"),
        HealthTag("걸음걸이가 이상해요")
    ]
    var body: some View {
        HealthTagShow(tags: $customtags)
    }
}
