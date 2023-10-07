//
//  Color+Extension.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI
import UIKit


extension Color {
    init(hex: UInt64) {
        self.init(uiColor: UIColor(hexValue: hex))
    }
    
    var uiColor: UIColor {
        return UIColor(cgColor: self.cgColor!)
    }
}

extension UIColor {
    public static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    convenience init(red: UInt64, green: UInt64, blue: UInt64) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
   
    public
    convenience init(hexValue: UInt64) {
        self.init(
            red: (hexValue & 0xFF0000) >> 16,
            green: (hexValue & 0x00FF00) >> 8,
            blue: hexValue & 0x0000FF
        )
    }

}
