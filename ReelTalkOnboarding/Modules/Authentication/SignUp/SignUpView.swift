//
//  SignUpView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//


import SwiftUI
import Firebase
import GoogleSignIn

struct SignUpView: View {
    @State private var showLoginView: Bool = false
    @State private var showProfileView: Bool = false
    @State private var displayEmail: String = ""
    @State private var displayPassword: String = ""
    @State private var displayFirstName: String = ""
    @State private var isPasswordVisible: Bool = false
    // Assuming this state is needed
    @State private var showPushNotifView: Bool = false
    @State private var isChecked: Bool = false
    
    @ObservedObject private var viewModel = SignUpViewModel()
  
    
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
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            TextField("", text: $displayFirstName)
                                .font(.custom(.regular, size: 17))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))
                                .modifier(PlaceholderModifier(placeholder: "First Name", text: $displayFirstName, color: Color(hex: 0x6D6D6D)))
                                .padding(.leading, 25)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: 0xFFFFFF))
                                .padding(.horizontal)
                                .padding(.bottom, 25)
                            TextField("", text: $displayEmail)
                                .font(.custom(.regular, size: 17))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))
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
                        HStack(spacing: 2) { // Add some spacing if needed
                            Checkbox(isChecked: $isChecked)
                                .padding(.trailing, 5)
                            Text("I agree to Reel Talk’s ")
                                .font(.custom(.regular, size: 11))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))
                            Button(action: {
                                // navigate to Terms of Use page
                            }) {
                                Text("Terms of Use")
                                    .font(.custom(.regular, size: 11))
                                    .foregroundColor(Color(hex: 0xFFA724))
                            }
                            Text(" and ")
                                .font(.custom(.regular, size: 11))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))
                            Button(action: {
                                // navigate to Privacy Policy page
                            }) {
                                Text("Privacy Policy")
                                    .font(.custom(.regular, size: 11))
                                    .foregroundColor(Color(hex: 0xFFA724))
                            }
                        }
                        
                        
                        
                        Spacer()
                        
                        SquareButton(title: "Create Account") {
                            showPushNotifView = true
                        }
                        .frame(width: 300, height: 48, alignment: .center)
                        .cornerRadius(8)
                        .padding(.bottom, 25)
                        .padding(.top, 60)
                        
                        ClearButton(image: Image("apple"), title: "Continue with Apple") {viewModel.startSignInWithAppleFlow()
                            
                        }
                            .padding(.bottom, 10)
                        
                        ClearButton(image: Image("google logo"), title: "Continue with Google") {
                            Task {
                                await viewModel.signInWithGoogle()
                            }
                            
                        }
                            .padding(.bottom, 10)
                        
                        ClearButton(image: Image("facebooklogo"), title: "Continue with Facebook") {}
                            .padding(.bottom, 10) // Fixed here
                        
                        HStack {
                            alreadyHaveAnAccountButton
                                .padding(.bottom, 20)
                                .fullScreenCover(isPresented: $showLoginView) {
                                    LoginView()
                                }
                        }
                    }
                }
                
                
                .navigationBarItems(leading:
                                        HStack {
                    Button(action: {
                        showLoginView = true
                    }) {
                        Image("<") // Using the SF Symbol for left arrow
                    }
                    Text("Create your Account")
                        .font(.custom(.medium, size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                }
                                    
                )
                .padding(.top, 70)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        }
    
    var alreadyHaveAnAccountButton: some View {
        Button(action: {
            showLoginView.toggle()
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
struct Checkbox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .foregroundColor(isChecked ? .white : .white)
                .frame(width: 20, height: 20)
        }
    }
}
                         struct SignUpView_Previews: PreviewProvider {
                    static var previews: some View {
                        SignUpView()
                    }
                }
                         



