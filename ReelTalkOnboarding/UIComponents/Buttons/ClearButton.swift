//
//  ClearButton.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/16/23.
//
import SwiftUI

struct ClearButton: View {
    let image: Image
    let title: String
    let color: Color = Color(hex: 0xFFA724)
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                image
                    .resizable()
                    .frame(width: 16, height: 18.99515)
                Text(title)
                    .font(.custom(.regular, size: 17))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.92))
            }
            .padding(10)
            .frame(width: 300, height: 48, alignment: .center)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(.white.opacity(0.6), lineWidth: 1)
            )
        }
    }
}
