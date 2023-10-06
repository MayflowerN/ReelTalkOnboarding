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
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)
        
                VStack {
                    Text("HomeView")
                        .foregroundColor(.white)
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
