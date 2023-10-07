//
//  LoginView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI


struct LoginView: View {
    
    // State variable to control the presentation of the SignUp screen.
    @State private var showSignUpView: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                // Text label displaying the title or screen identifier.
                Text("LoginView")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .foregroundColor(Color(hex: 0xFFFFFF))
                
                Spacer()
                
                // Provides option for users to sign up if they don't have an account.
                HStack {
                    Text("Do not have an account? ")
                        .font(Font.custom("Avenir Next", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                    
                    // Button to toggle the presentation of the SignUp screen.
                    Button(action: {
                        showSignUpView.toggle()  // Toggles the state variable controlling the presentation of SignUp screen.
                    }) {
                        Text("Sign up")
                            .font(.custom(.regular, size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: 0xFFA724))
                    }
                }
                Spacer() 
            }
            // Displays the SignUp screen over the Login screen when triggered.
            .fullScreenCover(isPresented: $showSignUpView) {
                SignUpView()
            }
            
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
