//
//  WelcomeView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI


struct WelcomeView: View {
    // Controls the presentation of the GenreSelection screen.
    
    @State private var showPushNotifView: Bool = false
    
    var body: some View {
        ZStack {  
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            
            // Conditional view rendering: If showGenreSelectionView is true, present the GenreSelectionView.
            if showPushNotifView {
                PushNotifView()
            } else {
               
                VStack {
                    
                    // Personalized welcome text for the user.
                    Text("Welcome, Karl!")
                        .font(.custom(.demiBold, size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 312, alignment: .top)
                    
                    
                    Image ("Welcomeimage")
                    
                    // Description text to give users an idea about what's next.
                    Text("Let’s get to know you better and personalize your experience!")
                        .font(.custom(.regular, size: 17))
                        .kerning(0.34)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 344, alignment: .top)
                        .padding(70)
                    
                    // Action button that, when tapped, presents the genre selection view.

                    SquareButton(title: "Continue") {
                        showPushNotifView = true
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
