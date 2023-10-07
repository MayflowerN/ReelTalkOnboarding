//
//  MediumText.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI

// Custom view for displaying text with a medium font style.
struct MediumText: View {
    // Text content, size, and color.
    let text: String
    let size: CGFloat
    let color: Color
    
    // Initializer with default values for size and color.
    init(_ text: String, size: CGFloat = 12, color: Color = Color(hex: 0x494949)) {
        self.text = text
        self.size = size
        self.color = color
    }
    
    var body: some View {
        // Display text with medium font, specified color, and center alignment.
        Text(text)
            .font(.custom(.medium, size: size))
            .foregroundColor(color)
            .multilineTextAlignment(.center)
    }
}
