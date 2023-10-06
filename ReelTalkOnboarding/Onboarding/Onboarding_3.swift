//
//  Onboarding_3.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

import SwiftUI

// The third and final onboarding screen before users take action to sign up or log in.
struct Onboarding_3: View {
    @Binding var currentPage: Int  // Keeps track of the current onboarding page (for page indicators).
    @State private var showLoginView: Bool = false  // Controls the presentation of the login screen.
    @State private var showSignUpView: Bool = false  // Controls the presentation of the sign-up screen.

    var body: some View {
        ZStack {  // Allows layering of views.
            
            // Sets a uniform dark background color across the entire view.
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)  // Ensures full coverage, beyond safe areas.

            // Main content arranged vertically.
            VStack {
                Spacer()  // Flexible space above content.

                // Graphical representation for the final onboarding step using an image.
                Image("RTOnboarding_3")
                    .frame(width: 300, height: 300)  // Specifies the image dimensions.
                    .background(.white.opacity(0.92))  // Adds a semi-transparent white background.
                    .cornerRadius(20)  // Rounds the corners of the image's background.

                Spacer()  // Flexible space below the image.

                // Encouraging message for users to begin their journey.
                Text("Let’s get started!")
                    .font(Font.custom("Avenir Next", size: 17))
                    .kerning(0.34)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.92))
                    .frame(width: 360, alignment: .top)

                // Indicates which page of the onboarding process the user is currently on.
                PageDots(current: $currentPage, total: 3)
                    .padding(20)

                // "Continue" button that leads to the sign-up process.
                Button(action: {
                    showSignUpView.toggle()  // Toggles the presentation of the sign-up view.
                }) {
                    Text("Continue")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                        .padding(10)
                        .frame(width: 300, height: 48, alignment: .center)
                        .background(Color(red: 1, green: 0.66, blue: 0.14))
                        .cornerRadius(8)
                        .padding(.bottom, 20)  // Provides space below the button.
                }
                .fullScreenCover(isPresented: $showSignUpView) {
                    SignUpView()  // Displays the sign-up screen when triggered.
                }

                // Option for users to log in if they already have an account.
                HStack {
                    Text("Already have an account? ")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))

                    // Button to present the login view.
                    Button(action: {
                        showLoginView.toggle()  // Toggles the presentation of the login view.
                    }) {
                        Text("Log in")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                    }
                    .fullScreenCover(isPresented: $showLoginView) {
                        LoginView()  // Displays the login screen when triggered.
                    }
                }
                .padding(.bottom, 20)  // Provides space below the login prompt.

                Spacer()  // Flexible space at the bottom.
            }
        }
    }
}

// Provides a visual preview of the Onboarding_3 screen for Xcode's design canvas.
struct Onboarding_3_Previews: PreviewProvider {
    @State static var dummyPage = 2  // A mock value to simulate the current page for the preview.
    
    static var previews: some View {
        Onboarding_3(currentPage: $dummyPage)
    }
}

