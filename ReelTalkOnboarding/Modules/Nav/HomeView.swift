//
//  HomeView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/5/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
        
                VStack {
                    Text("HomeView")
                        .foregroundColor(Color(hex: 0xFFFFFF))
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
