//
//  PickerSizeExtension.swift
//  GilCat
//
//  Created by KYUBO A. SHIM on 2022/06/13.
//

import Foundation
import SwiftUI

extension UIPickerView {
    open override var intrinsicContentSize: CGSize {
    return CGSize(width: 150, height: 150)
    }
}
