//
//  Onboarding_2.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

import SwiftUI


struct Onboarding_2: View {
    @Binding var currentPage: Int        // Bindable integer indicating the current step/page in the onboarding sequence
    @State private var showLoginView: Bool = false  // State variable controlling when the login view is presented to the user

    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Graphical representation for the onboarding step using an image
                Image ("RTOnboarding_2")
                    .frame(width: 300, height: 300)
                    .background(Color(hex: 0xFFFFFFEB))
                    .cornerRadius(20)

                Spacer()

                // Description or statement related to this onboarding step
                Text("Discover and discuss your favorite films, movies, and shows")
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


struct Onboarding_2_Previews: PreviewProvider {
    @State static var dummyPage = 1  // Placeholder value to simulate the onboarding page state for previewing purposes
    
    static var previews: some View {
        Onboarding_2(currentPage: $dummyPage)
    }
}
