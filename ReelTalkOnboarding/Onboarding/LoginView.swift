//
//  LoginView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

// Represents the login screen of the application where existing users can sign in.
struct LoginView: View {
    
    // State variable to control the presentation of the SignUp screen.
    @State private var showSignUpView: Bool = false
    
    var body: some View {
        ZStack {  // Allows for layering of views.
            
            // Sets a uniform dark background color across the entire view.
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)  // Ensures full coverage, extending beyond safe areas.
            
            // Main content arranged vertically.
            VStack {
                Spacer()  // Flexible space above content.
                
                // Text label displaying the title or screen identifier.
                Text("LoginView")
                    .padding(.horizontal, 20)  // Horizontal padding for aesthetics.
                    .padding(.vertical, 8)  // Vertical padding for aesthetics.
                    .foregroundColor(.white)  // Text color.
                
                Spacer()  // Flexible space below the title.
                
                // Provides option for users to sign up if they don't have an account.
                HStack {
                    Text("Do not have an account? ")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                    
                    // Button to toggle the presentation of the SignUp screen.
                    Button(action: {
                        showSignUpView.toggle()  // Toggles the state variable controlling the presentation of SignUp screen.
                    }) {
                        Text("Sign up")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                    }
                }
                Spacer()  // Flexible space at the bottom.
            }
            // Displays the SignUp screen over the Login screen when triggered.
            .fullScreenCover(isPresented: $showSignUpView) {
                SignUpView()
            }
            
        }
    }
}

// Provides a visual preview of the LoginView for Xcode's design canvas.
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
