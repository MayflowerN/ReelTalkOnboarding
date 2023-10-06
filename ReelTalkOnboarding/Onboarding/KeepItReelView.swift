//
//  KeepItReelView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

struct KeepItReelView: View {
    @State private var showHomeView: Bool = false
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)
            if showHomeView {
                HomeView()
            } else {
            VStack {
                // Mobile/H1
                Text("🚧 Keep it reel, but be kind  ")
                  .font(Font.custom("Avenir Next", size: 34))
                  .foregroundColor(.white)
                  .frame(width: 239, alignment: .leading)
                  .padding(.trailing, 90)
                  .padding(.bottom, 5)
                
                // Mobile/Body
                Text("Welcome, we’re so excited to have you here!\n\nAt Reel Talk, we believe that every individual brings something unique to our community. We are committed to fostering a safe and respectful environment for everyone to engage in exciting conversations.\n\nIn our mission to encourage respect and belongingness, we ask that you join us by adhering to our guidelines. We take these guidelines seriously, and failure to adhere to them may result in being banned from our community. Thanks for your cooperation.\n\nWith love,\nThe Reel Talk Team")
                  .font(Font.custom("Avenir Next", size: 17))
                  .kerning(0.34)
                  .foregroundColor(.white)
                  .frame(width: 329, alignment: .topLeading)
                Button (action: {
                   showHomeView = true
                    
                }) {
                    // Mobile/Headline
                    Text("I agree")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                        .padding(10)
                        .frame(width: 300, height: 48, alignment: .center)
                        .background(Color(red: 1, green: 0.66, blue: 0.14))
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                }
                
            }
        }
    }
}

struct KeepItReelView_Previews: PreviewProvider {
    static var previews: some View {
        KeepItReelView()
    }
}
