//
//  Color+Extension.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI
import UIKit

// Color extension to add utility methods and initializers related to hex values.
extension Color {
    // Initializer to create a SwiftUI Color from a hex value.
    init(hex: UInt64) {
        self.init(uiColor: UIColor(hexValue: hex))
    }
    
    // Convert SwiftUI Color to UIColor.
    var uiColor: UIColor {
        return UIColor(cgColor: self.cgColor!)
    }
}

// UIColor extension to add utility methods and initializers related to RGB and hex values.
extension UIColor {
    // Static method to create UIColor using RGB values (0-255).
    public static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    // Initializer to create UIColor using RGB components (0-255).
    convenience init(red: UInt64, green: UInt64, blue: UInt64) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    // Initializer to create UIColor from a hex value.
    public
    convenience init(hexValue: UInt64) {
        self.init(
            red: (hexValue & 0xFF0000) >> 16,
            green: (hexValue & 0x00FF00) >> 8,
            blue: hexValue & 0x0000FF
        )
    }
}

