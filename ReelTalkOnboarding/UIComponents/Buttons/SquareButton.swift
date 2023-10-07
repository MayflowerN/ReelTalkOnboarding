//
//  SquareButton.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import SwiftUI


struct SquareButton: View {
    // The title displayed on the button.
    let title: String
    // The color of the button's text, with a default value of a specific hex color.
    let color: Color = Color(hex: 0xFFA724)
    // The action to be executed when the button is pressed.
    let action: () -> Void

    var body: some View {
        // Button that takes in the provided action.
        Button(action: action) {
            // The text inside the button uses a custom text view `DemiBoldText`.
            DemiBoldText(title, size: 17)
                .foregroundColor(color)
                .padding(10)
                .frame(width: 300, height: 48, alignment: .center)
                .background(Color(hex: 0xFFA724))
                .cornerRadius(8)
        }
    }
}
