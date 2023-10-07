//
//  RegularText.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI


struct RegularText: View {
    let text: String
    let size: CGFloat
    let color: Color
    
    init(_ text: String, size: CGFloat = 12, color: Color = Color(hex: 0x494949)) {
        self.text = text
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Text(text)
            .font(.custom(.regular, size: size))
            .foregroundColor(color)
            .multilineTextAlignment(.center)
    }
}

