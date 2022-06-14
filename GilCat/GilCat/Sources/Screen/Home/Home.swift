//
//  Home.swift
//  GilCat
//
//  Created by Woody on 2022/06/14.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            HomeContainer(viewModel: viewModel)
                .ignoresSafeArea()
            if $viewModel.isPopup.wrappedValue {
                CatSelectPopup(isPopup: $viewModel.isPopup,
                               cat: $viewModel.selectedCat)
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
