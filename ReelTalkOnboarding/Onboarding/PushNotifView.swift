//
//  PushNotifView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//
import SwiftUI

// Represents a view asking the user to enable push notifications.
struct PushNotifView: View {
    // Controls the presentation of the Welcome screen.
    @State private var showWelcomeView = false
    
    var body: some View {
        ZStack {  // Enables layering of views.
            
            // Sets a uniform dark background color across the entire view.
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)
            
            // Conditional rendering: If `showWelcomeView` is true, present the WelcomeView.
            if showWelcomeView {
                WelcomeView()
            } else {
                VStack(spacing: 20) {  // Vertically stacks the content with spacing.
                    
                    // Heading prompting the user to enable push notifications.
                    Text("Turn on push  notifications")
                      .font(Font.custom("Avenir Next", size: 28))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white.opacity(0.92))
                      .frame(width: 350, alignment: .top)
                      .padding(.top, 35)  // Additional padding at the top for aesthetics.
                    
                    // Description elaborating the benefits of enabling push notifications.
                    Text("Stay in the loop with fellow enthusiasts in discussions. \n Get instant alerts on upcoming movies,  fan-favorite recommendations, and exciting movie events.")
                        .font(Font.custom("Avenir Next", size: 17))
                        .kerning(0.34)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 350, alignment: .top)
                    
                    Spacer()  // Flexible space to push items apart.
                    
                    // Additional information regarding push notification settings.
                    Text("You can turn it off anytime in the system notification settings.")
                        .font(Font.custom("Avenir Next", size: 13))
                        .kerning(0.26)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 312, alignment: .top)
                        .padding(.bottom, 25)  // Additional padding at the bottom for aesthetics.
                    
                    // Button to enable notifications.
                    Button (action: {
                        showWelcomeView = true
                    }) {
                        Text("Turn on notifications")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(10)
                            .frame(width: 300, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.66, blue: 0.14))
                            .cornerRadius(8)
                    }
                    
                    // Button for users who choose to skip enabling notifications.
                    Button (action: {}) {
                        Text("Not now")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white.opacity(0.92))
                            .padding(10)
                            .frame(width: 300, height: 48, alignment: .center)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.5)
                                    .stroke(.white.opacity(0.6), lineWidth: 1)  // Outlined border for visual distinction.
                            )
                    }
                }
                .padding(.bottom,50)  // Ensures content is nicely spaced from the bottom edge.
            }
        }
    }
}

// Provides a visual preview of the PushNotifView for Xcode's design canvas.
struct PushNotifView_Previews: PreviewProvider {
    static var previews: some View {
        PushNotifView()
    }
}

