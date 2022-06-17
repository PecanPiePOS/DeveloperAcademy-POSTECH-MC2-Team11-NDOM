import SwiftUI

@main
struct GilCatApp: App {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    @StateObject var newCatModel: NewCatRegisterViewModel = NewCatRegisterViewModel()
    var body: some Scene {
        WindowGroup {
            Home(viewModel: viewModel)
        }
    }
}
