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
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            if showKeepItReelView {
                KeepItReelView()
            } else {
            VStack {
                Text("TVShowSelectionView")
                    .foregroundColor(Color(hex: 0xFFFFFF))
                
                SquareButton(title: "Continue") {
                    showKeepItReelView = true
              
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
