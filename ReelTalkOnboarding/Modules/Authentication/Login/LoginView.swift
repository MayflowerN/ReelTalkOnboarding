//
//  LoginView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices


struct LoginView: View {
    
    // State variable to control the presentation of the SignUp screen.
    @State private var showSignUpView: Bool = false
    @State private var showPushNotifView: Bool = false
    @State private var displayEmail: String = ""
    @State private var displayPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    
    @ObservedObject private var viewModel = SignUpViewModel()
    
    @Environment(\.colorScheme) var colorScheme

  

    init() {
           // Set navigation bar background color
           UINavigationBar.appearance().backgroundColor = UIColor(Color(hex: 0x212121))
       }
    var body: some View {
        NavigationView {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Spacer()
                    // Text label displaying the title or screen identifier.
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            TextField("", text: $displayEmail)
                                .font(.custom(.regular, size: 17))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))  // Set color for the entered text
                                .modifier(PlaceholderModifier(placeholder: "Email", text: $displayEmail, color: Color(hex: 0x6D6D6D)))
                                .padding(.leading, 25)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: 0xFFFFFF))
                                .padding(.horizontal)
                                .padding(.bottom, 25)
                            VStack(spacing: 0) {
                                HStack {
                                    if isPasswordVisible {
                                        TextField("Password", text: $displayPassword)
                                            .font(.custom(.regular, size: 17))
                                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                                            .modifier(PlaceholderModifier(placeholder: "Password", text: $displayPassword, color: Color(hex: 0x6D6D6D)))
                                            .padding(.leading, 25)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                    } else {
                                        SecureField("Password", text: $displayPassword)
                                            .font(.custom(.regular, size: 17))
                                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                                            .modifier(PlaceholderModifier(placeholder: "Password", text: $displayPassword, color: Color(hex: 0x6D6D6D)))
                                            .padding(.leading, 25)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                    }
                                    Button(action: {
                                        isPasswordVisible.toggle()
                                    }) {
                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                                            .padding(.trailing, 10)
                                    }
                                }
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: 0xFFFFFF))
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                            }
                            .padding(.bottom, 25)
                        }
                    }
                    Spacer()
                    
                    SquareButton(title: "Log In") {
                        showPushNotifView = true
                    }
                    .frame(width: 300, height: 48, alignment: .center)
                    .cornerRadius(8)
                    .padding(.bottom, 25)
                    .padding(.top, 70)
                    
                    
                    // Apple login button placed alongside the Continue button
                    
                    ClearButton(image: Image("apple"), title: "Continue with Apple") {
                        viewModel.startSignInWithAppleFlow()
                    }
                    .padding(.bottom, 10)
                   /* SignInWithAppleButton { request in
                        viewModel.handleSignInWithAppleRequest(request)
                    } onCompletion: { result in
                        viewModel.handleSignInWithAppleCompletion(result)
                    }
                    .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .cornerRadius(8)
                    */
                    ClearButton(image: Image("google logo"), title: "Continue with Google") {
                        Task {
                            await viewModel.signInWithGoogle()
                        }
                    }
                    .padding(.bottom, 10)
                    ClearButton(image: Image("facebooklogo"), title: "Continue with Facebook") {
                        viewModel.signInWithFacebook { (success, error) in
                            if success {
                                print("Successfully logged in with Facebook!")
                            } else if let error = error {
                                print("Error occurred: \(error.localizedDescription)")
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    // Move this HStack below the buttons
                    HStack {
                        Text("Do not have an account? ")
                            .font(.custom(.regular, size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                        
                        // Button to toggle the presentation of the SignUp screen.
                        Button(action: {
                            showSignUpView.toggle()  // Toggles the state variable controlling the presentation of the SignUp screen.
                        }) {
                            Text("Sign up")
                                .font(.custom(.regular, size: 17))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: 0xFFA724))
                                
                            
                        }
                        
                    }
                    .padding(.top, 15)
                    
                    Spacer()
                }
                
            }
            
            // Displays the SignUp screen over the Login screen when triggered.
                
                            .navigationBarItems(leading:
                                HStack {
                                    Button(action: {
                                        showSignUpView = true
                                    }) {
                                        Image("<") // Using the SF Symbol for left arrow
                                    }
                                    Text("Log In")
                                    .font(.custom(.medium, size: 22))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white.opacity(0.92))
                                }
                            )
                            .fullScreenCover(isPresented: $showSignUpView) {
                                SignUpView()
                }
                            .padding(.top, 70)
            }
        
        .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
        
}
struct PlaceholderModifier: ViewModifier {
    var placeholder: String
    @Binding var text: String
    var color: Color

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(color)
            }
            content
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

