import SwiftUI

@main
struct GilCatApp: App {
    var catInfo : CatInfo = CatInfo()
    
    var body: some Scene {
        WindowGroup {
            Register1().environmentObject(catInfo)
        }
    }
}
