//
//  Onboarding_2.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

import SwiftUI

// Second screen of the onboarding process
struct Onboarding_2: View {
    @Binding var currentPage: Int        // Bindable integer indicating the current step/page in the onboarding sequence
    @State private var showLoginView: Bool = false  // State variable controlling when the login view is presented to the user

    var body: some View {
        ZStack {
            // Sets a uniform dark background color across the entire view
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)

            // Main content area that vertically stacks its children
            VStack {
                Spacer()  // Creates a flexible space to push content away from the top

                // Graphical representation for the onboarding step using an image
                Image ("RTOnboarding_2")
                    .frame(width: 300, height: 300)  // Explicit frame size for the image
                    .background(.white.opacity(0.92)) // Semi-transparent white background for the image
                    .cornerRadius(20)  // Rounded corners for the image's background

                Spacer()  // Creates another flexible space

                // Description or statement related to this onboarding step
                Text("Discover and discuss your favorite films, movies, and shows")
                  .font(Font.custom("Avenir Next", size: 17))
                  .kerning(0.34)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white.opacity(0.92))
                  .frame(width: 360, alignment: .top)

                // Visual indicators showing the user's progression through the onboarding steps
                PageDots(current: $currentPage, total: 3)

                Spacer()  // Another flexible space

                // Provides an option for users who may already have an account
                HStack {
                    Text("Already have an account? ")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))

                    // Action button offering a transition to a login view
                    Button(action: {
                        showLoginView.toggle()  // Toggles the state, deciding if the login view should be shown or not
                    }) {
                        Text("Log in")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                    }
                    .fullScreenCover(isPresented: $showLoginView) { // A modal style presentation covering the entire screen
                        LoginView()  // Displays the login view when the state dictates it should be presented
                    }
                }

                Spacer()  // Final flexible space to push content away from the bottom
            }
        }
    }
}

// Provides a visual representation of how the `Onboarding_2` screen looks, useful during development
struct Onboarding_2_Previews: PreviewProvider {
    @State static var dummyPage = 1  // Placeholder value to simulate the onboarding page state for previewing purposes
    
    static var previews: some View {
        Onboarding_2(currentPage: $dummyPage)
    }
}
