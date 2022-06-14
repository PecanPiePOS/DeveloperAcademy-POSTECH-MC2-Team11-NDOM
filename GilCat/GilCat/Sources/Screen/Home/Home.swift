//
//  Home.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State var isPopup: Bool = false
    var body: some View {
        ZStack {
            HomeContainer(viewModel: viewModel)
                .ignoresSafeArea()
            if viewModel.selectedIndex != -1 {
                CatSelectPopup(isPopup: $isPopup,
                               gilCatData: $viewModel.catLists)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewModel: HomeViewModel())
    }
}
