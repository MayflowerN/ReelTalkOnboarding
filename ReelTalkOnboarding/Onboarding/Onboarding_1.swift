//
//  Onboarding_1.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//


import SwiftUI


struct Onboarding_1: View {
   
    @Binding var currentPage: Int
    @State private var showLoginView: Bool = false

    var body: some View {
       
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)

            
            VStack {
                Spacer()
                // Display an onboarding image with styling
                Image ("RTOnboarding_1")
                    .frame(width: 300, height: 300)
                    .background(Color(hex: 0xFFFFFFEB))
                    .cornerRadius(20)

                Spacer()

                // A welcome text for users with styling
                Text("Welcome to Reel Talk, a community designed for true film and TV Show fans ")
                  .font(.custom(.regular, size: 17))
                  .kerning(0.34)
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(hex: 0xFFFFFFEB))
                  .frame(width: 360, alignment: .top)

               
                Spacer()
                Spacer()
               
            }
        }
    }
}


struct Onboarding_1_Previews: PreviewProvider {
    @State static var dummyPage = 0  // A dummy state to simulate the page number for preview
    
    static var previews: some View {
        Onboarding_1(currentPage: $dummyPage)
    }
}
