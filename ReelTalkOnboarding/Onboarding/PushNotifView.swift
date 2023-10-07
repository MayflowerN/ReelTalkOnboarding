//
//  PushNotifView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//
import SwiftUI


struct PushNotifView: View {
    // Controls the presentation of the Welcome screen.
    @State private var showGenreSelectionView = false
    
    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            
            // Conditional rendering: If `showWelcomeView` is true, present the WelcomeView.
            if showGenreSelectionView{
                GenreSelectionView()
            } else {
                VStack(spacing: 20) {
                    
                    // Heading prompting the user to enable push notifications.
                    Text("Turn on push  notifications")
                        .font(.custom(.demiBold, size: 28))
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(hex: 0xFFFFFFEB))
                      .frame(width: 350, alignment: .top)
                      .padding(.top, 35)
                    // Additional padding at the bottom for aesthetics.
                    
                    // Description elaborating the benefits of enabling push notifications.
                    Text("Stay in the loop with fellow enthusiasts in discussions. \n Get instant alerts on upcoming movies,  fan-favorite recommendations, and exciting movie events.")
                        .font(.custom(.regular, size: 17))
                        .kerning(0.34)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 350, alignment: .top)
                    
                    Spacer()
                    
                    // Additional information regarding push notification settings.
                    Text("You can turn it off anytime in the system notification settings.")
                        .font(.custom(.regular, size: 13))
                        .kerning(0.26)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 312, alignment: .top)
                        .padding(.bottom, 25)  // Additional padding at the bottom for aesthetics.
                    
                    // Button to enable notifications.
                    SquareButton(title: "Turn on notification") {
                        self.showGenreSelectionView = true
                    }
                    
                    // Button for users who choose to skip enabling notifications.
                    Button (action: {}) {
                        Text("Not now")
                            .font(.custom(.demiBold, size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: 0xFFFFFFEB))
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

struct PushNotifView_Previews: PreviewProvider {
    static var previews: some View {
        PushNotifView()
    }
}

