//
//  SignUpView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//


import SwiftUI

// Represents the SignUp screen for the app where users initiate their registration process.
struct SignUpView: View {
    @State private var showLoginView: Bool = false  // Controls the presentation of the Login screen.
    @State private var showProfileView: Bool = false  // Controls the presentation of the Profile setup screen post-signup.
    
    var body: some View {
        ZStack {  // Allows for layering of views.
            
            // Sets a uniform dark background color across the entire view.
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)  // Ensures full coverage, extending beyond safe areas.
            
            // Main content arranged vertically.
            VStack {
                Spacer()  // Flexible space above content.
                
                // Text label displaying the title or screen identifier.
                Text("SignUpView")
                    .padding(.horizontal, 20)  // Horizontal padding for aesthetics.
                    .padding(.vertical, 8)  // Vertical padding for aesthetics.
                    .foregroundColor(.white)  // Text color.
                
                Spacer()  // Flexible space below the title.
                
                // Button for users to create an account.
                Button(action: { showProfileView.toggle() }) {  // Toggles the presentation of the Profile setup view.
                    Text("Create account")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                        .padding(10)  // Padding around the text for better touch target and aesthetics.
                        .frame(width: 300, height: 48, alignment: .center)
                        .background(.white.opacity(0.92))  // Semi-transparent white background for button.
                        .cornerRadius(8)  // Rounded corners for the button.
                }
                // Displays the ProfileView screen when triggered.
                .fullScreenCover(isPresented: $showProfileView) {
                    ProfileView()
                }
                
                Spacer()  // Flexible space below the button.
                
                // Provides option for users to log in if they already have an account.
                HStack {
                    Text("Already have an account? ")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                    
                    // Button to present the login view.
                    Button(action: {
                        showLoginView.toggle()  // Toggles the presentation of the Login screen.
                    }) {
                        Text("Log in")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                    }
                    // Displays the LoginView screen when triggered.
                    .fullScreenCover(isPresented: $showLoginView) {
                        LoginView()
                    }
                }
                .padding(.bottom, 20)  // Provides space below the login prompt, improving aesthetics.
            }
        }
    }
}

// Provides a visual preview of the SignUpView in Xcode's design canvas.
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}




