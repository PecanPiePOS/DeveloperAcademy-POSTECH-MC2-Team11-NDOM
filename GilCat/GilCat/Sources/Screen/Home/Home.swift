//
//  Home.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @StateObject var newCatModel: NewCatModel = NewCatModel()
    @State var registerIsActive: Bool = false
    var body: some View {
        VStack {
            Button {
                registerIsActive = true
            } label: {
                Text("ajflajsfiajfhoaihfaoifhao")
            }
            ZStack {
                HomeContainer(viewModel: viewModel)
                    .ignoresSafeArea()
                    .fullScreenCover(isPresented: $registerIsActive) {
                        RegisterStart(popToRoot: $registerIsActive).environmentObject(newCatModel)
                    }
                
                if $viewModel.isCatPopup.wrappedValue {
                    CatSelectPopup(isPopup: $viewModel.isCatPopup,
                                   cat: $viewModel.selectedCat)
                }
            }
        }
    }
}
/*
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewModel: HomeViewModel())
    }
}
*/
