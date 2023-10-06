//
//  TVShowsSelectionView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/5/23.
//

import SwiftUI

struct TVShowsSelectionView: View {
    @State private var showKeepItReelView: Bool = false
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)
            if showKeepItReelView {
                KeepItReelView()
            } else {
            VStack {
                Text("TVShowSelectionView")
                    .foregroundColor(.white)
                Button (action: {
                    
                    showKeepItReelView = true
                }) {
                    // Mobile/Headline
                    Text("Continue")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                        .padding(10)
                        .frame(width: 300, height: 48, alignment: .center)
                        .background(Color(red: 1, green: 0.66, blue: 0.14))
                        .cornerRadius(8)
                }
                }
            }
        }
    }
}

struct TVShowsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsSelectionView()
    }
}
