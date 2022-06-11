import SwiftUI

@main
struct GilCatApp: App {
    var catInfo : CatInfoList = CatInfoList()
    
    var body: some Scene {
        WindowGroup {
            Register1().environmentObject(catInfo)
        }
    }
}
