import SwiftUI

@main
struct GilCatApp: App {
    var catInfo: GilCatDataManager = GilCatDataManager()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
