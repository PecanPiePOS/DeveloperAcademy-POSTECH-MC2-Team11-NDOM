import SwiftUI

@main
struct GilCatApp: App {

    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            Home(viewModel: viewModel)
        }
    }
}
