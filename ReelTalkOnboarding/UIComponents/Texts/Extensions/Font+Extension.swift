//
//  Font+Extension.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//


import Foundation
import SwiftUI


extension Font {
    static func custom(_ font: AppFont, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
}
