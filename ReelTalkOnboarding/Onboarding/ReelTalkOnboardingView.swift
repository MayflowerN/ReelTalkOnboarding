//
//  ReelTalkOnboardingView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI


struct ReelTalkOnboardingView: View {
    // Keeps track of which onboarding screen is currently being displayed
    @State private var currentPage = 0
    @State private var showLoginView: Bool = false  // Controls the presentation of the login screen.
    @State private var showSignUpView: Bool = false  // Controls the presentation of the sign-up screen.

    var body: some View {
        // A UI component that displays a series of pages and allows for swipe navigation between them
        ZStack {
            TabView(selection: $currentPage) {
                
                Onboarding_1(currentPage: $currentPage)
                    .tag(0)  // Tag used for identifying this view in the TabView
                
                // The second onboarding page
                Onboarding_2(currentPage: $currentPage)
                    .tag(1)
                
                Onboarding_3(currentPage: $currentPage)
                    .tag(2)
            }
            // Styles the TabView to behave like pages with swipe-to-navigate functionality
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                PageDots(current: $currentPage, total: 3)
                    .padding(.bottom, 170)
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                if currentPage == 2 {
                    SquareButton(title: "Continue", action: {
                        showSignUpView.toggle()
                        // Toggles the presentation of the sign-up view.
                    })
                    .padding(.bottom, 20)
                    .fullScreenCover(isPresented: $showSignUpView) {
                        SignUpView()  // Replace with your sign-up view
                    }

                }
                    
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

// Provides a visual preview of ReelTalkOnboardingView in Xcode's canvas
struct ReelTalkOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ReelTalkOnboardingView()
    }
}

// A custom view to display visual indicators of the user's progress through the onboarding pages
struct PageDots: View {
    @Binding var current: Int  // The index of the currently displayed onboarding page
    var total: Int  // The total number of onboarding pages

    var body: some View {
        // Arranges child views in a horizontal line
        HStack(spacing: 8) {
            // Loop through the total number of pages and create a circle for each one
            ForEach(0..<total) { index in
                Circle()
                    // Change the color of the circle based on whether it represents the current page
                    .fill(index == current ? (Color(hex: 0xFFA724)) : Color.gray)
                    // Adjust the size of the circle based on whether it represents the current page
                    .frame(width: index == current ? 7 : 8, height: index == current ? 7 : 8)
                    // Apply a smooth animation to the circle's transition (e.g., when it changes size or color)
                    .animation(.easeInOut)
            }
        }
    }
}

