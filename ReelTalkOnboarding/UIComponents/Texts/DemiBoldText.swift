//
//  DemiBoldText.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI

// A custom view for displaying text with a demi-bold style.
struct DemiBoldText: View {
    // Properties for text content, size, and color.
    let text: String
    let size: CGFloat
    let color: Color
    
    // Initializer with default values for size and color.
    init(_ text: String, size: CGFloat = 12, color: Color = Color(hex: 0x222222)) {
        self.text = text
        self.size = size
        self.color = color
    }
    
    var body: some View {
        // Text view setup with custom font, color, and center alignment.
        Text(text)
            .font(.custom(.demiBold, size: size))
            .foregroundColor(color)
            .multilineTextAlignment(.center)
    }
}
