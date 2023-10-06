//
//  Onboarding_1.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

// Import the SwiftUI library
import SwiftUI

// Define a new SwiftUI view named Onboarding_1
struct Onboarding_1: View {
    // A binding to keep track of the current onboarding page
    @Binding var currentPage: Int

    // State variable to decide when to display the login view
    @State private var showLoginView: Bool = false

    // Define the content and layout of this view
    var body: some View {
        // A ZStack is used to overlay elements on top of each other
        ZStack {
            // Set a dark background color for the entire screen
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)

            // A vertical stack to organize and position the elements vertically
            VStack {
                Spacer()  // Adds flexible space before the image

                // Display an onboarding image with styling
                Image ("RTOnboarding_1")
                    .frame(width: 300, height: 300)
                    .background(.white.opacity(0.92))
                    .cornerRadius(20)  // Rounded corners

                Spacer()  // Adds flexible space after the image

                // A welcome text for users with styling
                Text("Welcome to Reel Talk, a community designed for true film and TV Show fans ")
                  .font(Font.custom("Avenir Next", size: 17))
                  .kerning(0.34)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white.opacity(0.92))
                  .frame(width: 360, alignment: .top)

                // Page indicators to show progress in onboarding
                PageDots(current: $currentPage, total: 3)

                Spacer()  // Adds flexible space before the account text and button

                // A horizontal stack containing text and a button side by side
                HStack {
                    // Prompt text for existing users
                    Text("Already have an account? ")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))

                    // Button to navigate to the login screen
                    Button(action: {
                        showLoginView.toggle()  // Toggle the login view state
                    }) {
                        Text("Log in")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                        
                    }
                    // Overlay the LoginView when showLoginView is true
                    .fullScreenCover(isPresented: $showLoginView) {
                        LoginView()
                    }
                }

                Spacer()  // Adds flexible space after the account text and button
            }
        }
    }
}

// A struct to preview the Onboarding_1 view in Xcode's canvas or interface builder
struct Onboarding_1_Previews: PreviewProvider {
    @State static var dummyPage = 0  // A dummy state to simulate the page number for preview
    
    static var previews: some View {
        Onboarding_1(currentPage: $dummyPage)
    }
}
