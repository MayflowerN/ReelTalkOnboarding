//
//  RegularText.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI

// A custom view for displaying text with a regular style.
struct RegularText: View {
    // Properties: text content, size, and color.
    let text: String
    let size: CGFloat
    let color: Color
    
    // Initializer with default values.
    init(_ text: String, size: CGFloat = 12, color: Color = Color(hex: 0x494949)) {
        self.text = text
        self.size = size
        self.color = color
    }
    
    var body: some View {
        // Text setup with regular font, given color, and center alignment.
        Text(text)
            .font(.custom(.regular, size: size))
            .foregroundColor(color)
            .multilineTextAlignment(.center)
    }
}

