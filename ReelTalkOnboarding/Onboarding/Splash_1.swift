//
//  Splash_1.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//


import SwiftUI


struct Splash_1: View {
    // State variable to track when to navigate to the onboarding screen
    @State private var navigateToOnboarding = false

 
    var body: some View {
        
        ZStack {
            // Set a dark color for the background
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            // Ensures full coverage, extending beyond safe areas.

            VStack {
                // Display the application's logo
                Image("Final Proposed Logo")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit) // Maintain the image's aspect ratio
                    .frame(width: 176.05765, height: 193.06837) // Set the frame size
                
                // Display the application's name
                Text("REEL TALK")
                    .font(.custom(.demiBold, size: 34)) // Use custom font and size
                    .multilineTextAlignment(.center) // Center align the text
                    .foregroundColor(Color(hex: 0xFFFFFF)) // Set text color
                    .padding(.top, 20) // Add spacing above the text
            }
           
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



