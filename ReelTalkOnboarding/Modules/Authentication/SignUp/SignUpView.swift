//
//  SignUpView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//


import SwiftUI


struct SignUpView: View {
    @State private var showLoginView: Bool = false  // Controls the presentation of the Login screen.
    @State private var showProfileView: Bool = false  // Controls the presentation of the Profile setup screen post-signup.
    
    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)  
            
            VStack {
                Spacer()
                
                // Text label displaying the title or screen identifier.
                Text("SignUpView")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .foregroundColor(Color(hex: 0xFFFFFF))
                
                Spacer()
                
                // Button for users to create an account.
                Button(action: { showProfileView.toggle() }) {  // Toggles the presentation of the Profile setup view.
                    Text("Create account")
                        .font(.custom(.regular, size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0x222222))
                        .padding(10)
                        .frame(width: 300, height: 48, alignment: .center)
                        .background(Color(hex: 0xFFFFFFEB))
                        .cornerRadius(8)
                }
                // Displays the ProfileView screen when triggered.
                .fullScreenCover(isPresented: $showProfileView) {
                    ProfileView()
                }
                
                Spacer()  
                
                // Provides option for users to log in if they already have an account.
                HStack {
                   

                    // Button to navigate to the login screen
                    alreadyHaveAnAccountButton
                        .padding(.bottom, 20)
                        .fullScreenCover(isPresented: $showLoginView) {
                            LoginView()
                        }
                }
            }
        }
    }
    
    //represents a button prompting users if they have an account
    var alreadyHaveAnAccountButton: some View {
        Button(action: {
            showLoginView.toggle()  // Toggle the login view state
        }) {
            Group {
                Text("Already have an account? ")
                    .foregroundColor(Color(hex: 0xFFFFFF)) + Text(" Log in")
                    .foregroundColor(Color(hex: 0xFFA724))
            }
            .font(.custom(.regular, size: 17))
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}




