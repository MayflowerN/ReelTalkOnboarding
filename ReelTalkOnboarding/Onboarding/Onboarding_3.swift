//
//  Onboarding_3.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

import SwiftUI

struct Onboarding_3: View {
    @Binding var currentPage: Int  // Keeps track of the current onboarding page (for page indicators).
    @State private var showLoginView: Bool = false  // Controls the presentation of the login screen.
    @State private var showSignUpView: Bool = false  // Controls the presentation of the sign-up screen.

    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)

           
            VStack {
                Spacer()

                // Graphical representation for the final onboarding step using an image.
                Image("RTOnboarding_3")
                    .frame(width: 300, height: 300)
                    .background(Color(hex: 0xFFFFFFEB))
                    .cornerRadius(20)

                Spacer()

                // Encouraging message for users to begin their journey.
                Text("Let’s get started!")
                    .font(.custom(.regular, size: 17))
                    .kerning(0.34)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: 0xFFFFFFEB))
                    .frame(width: 360, alignment: .top)
                    .padding(.bottom, 15)
                
                Spacer()
                Spacer()
                
            }
        }
    }
}


struct Onboarding_3_Previews: PreviewProvider {
    @State static var dummyPage = 2  // A mock value to simulate the current page for the preview.
    
    static var previews: some View {
        Onboarding_3(currentPage: $dummyPage)
    }
}

