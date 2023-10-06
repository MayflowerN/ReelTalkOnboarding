//
//  Splash_1.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

// Import the SwiftUI library
import SwiftUI

// Define a new SwiftUI view named Splash_1
struct Splash_1: View {
    // State variable to track when to navigate to the onboarding screen
    @State private var navigateToOnboarding = false

    // Define the content and layout of this view
    var body: some View {
        // A layering stack to place views on top of each other
        ZStack {
            // Set a dark color for the background
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all) // This makes the color extend beyond safe areas

            // A vertical stack to organize the logo and the text
            VStack {
                // Display the application's logo
                Image("Final Proposed Logo")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                    .frame(width: 176.05765, height: 193.06837) // Set the frame size
                
                // Display the application's name
                Text("REEL TALK")
                    .font(Font.custom("Avenir Next", size: 34)) // Use custom font and size
                    .multilineTextAlignment(.center) // Center align the text
                    .foregroundColor(.white) // Set text color
                    .padding(.top, 20) // Add spacing above the text
            }
            // Add a behavior when this view appears
            .onAppear {
                // After a delay of 2 seconds, trigger the navigation state to change
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 2 seconds delay
                    navigateToOnboarding = true
                }
            }
        }
        // Overlay another view (ReelTalkOnboardingView) when navigateToOnboarding is true
        .fullScreenCover(isPresented: $navigateToOnboarding) {
            ReelTalkOnboardingView()  // Present the OnboardingView
        }
    }
}

// A struct to preview the Splash_1 view in Xcode's canvas or interface builder
struct Splash_1_Previews: PreviewProvider {
    static var previews: some View {
        Splash_1()
    }
}



