import Foundation
import SwiftUI

enum ViewVisibility: CaseIterable {
  case visible,
       invisible,
       gone
}

extension View {
  @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
    if visibility != .gone {
      if visibility == .visible {
        self
      } else {
        hidden()
      }
    }
  }
}
