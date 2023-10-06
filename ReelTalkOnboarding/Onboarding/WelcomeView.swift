//
//  WelcomeView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

// Represents a personalized welcome screen for users after they've signed in.
struct WelcomeView: View {
    // Controls the presentation of the GenreSelection screen.
    @State private var showGenreSelectionView: Bool = false
    
    var body: some View {
        ZStack {  // Allows for layering of views.
            
            // Sets a uniform dark background color across the entire view.
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)  // Ensures full coverage, extending beyond safe areas.
            
            // Conditional view rendering: If showGenreSelectionView is true, present the GenreSelectionView.
            if showGenreSelectionView {
                GenreSelectionView()
            } else {
                // Vertical stack to arrange components linearly.
                VStack {
                    
                    // Personalized welcome text for the user.
                    Text("Welcome, Karl!")
                        .font(Font.custom("Avenir Next", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 312, alignment: .top)
                    
                    // Placeholder image for a more visual greeting.
                    Image ("Welcomeimage")
                    
                    // Description text to give users an idea about what's next.
                    Text("Let’s get to know you better and personalize your experience!")
                        .font(Font.custom("Avenir Next", size: 17))
                        .kerning(0.34)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 344, alignment: .top)
                        .padding(70)  // Provides a uniform space around the text.
                    
                    // Action button that, when tapped, presents the genre selection view.
                    Button (action: {
                        showGenreSelectionView = true
                    }) {
                        Text("Continue")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(10)  // Padding around the text for better touch target and aesthetics.
                            .frame(width: 300, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.66, blue: 0.14))  // Button color.
                            .cornerRadius(8)  // Rounded corners for the button.
                    }
                }
            }
        }
    }
}

// Provides a visual preview of the WelcomeView for Xcode's design canvas.
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
