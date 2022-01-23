//
//  UIButton+.swift
//  Tipsy
//
//  Created by Bening Ranum on 18/01/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
}
