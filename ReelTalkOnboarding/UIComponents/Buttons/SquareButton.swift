//
//  SquareButton.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import SwiftUI

struct SquareButton: View {
    let title: String
    let color: Color = Color(hex: 0xFFA724)
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            DemiBoldText(title, size: 17)
                .foregroundColor(color)
                .padding(10)
                .frame(width: 300, height: 48, alignment: .center)
                .background(Color(hex: 0xFFA724))
                .cornerRadius(8)
        }
    }
}
