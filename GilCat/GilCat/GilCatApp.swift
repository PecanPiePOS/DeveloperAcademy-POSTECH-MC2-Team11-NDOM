import SwiftUI

@main
struct GilCatApp: App {

    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    @StateObject var newCatModel: NewCatModel = NewCatModel()
    var body: some Scene {
        WindowGroup {
            RegisterStart()
                .environmentObject(newCatModel)
//            Home(viewModel: viewModel)
        }
    }
}
