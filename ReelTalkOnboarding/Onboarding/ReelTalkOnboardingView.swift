//
//  ReelTalkOnboardingView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

// The primary onboarding screen that manages and displays individual onboarding pages
struct ReelTalkOnboardingView: View {
    // Keeps track of which onboarding screen is currently being displayed
    @State private var currentPage = 0

    var body: some View {
        // A UI component that displays a series of pages and allows for swipe navigation between them
        TabView(selection: $currentPage) {
            // The first onboarding page
            Onboarding_1(currentPage: $currentPage)
                .tag(0)  // Tag used for identifying this view in the TabView
            
            // The second onboarding page
            Onboarding_2(currentPage: $currentPage)
                .tag(1)  // Tag used for identifying this view in the TabView
            
            // The third onboarding page
            Onboarding_3(currentPage: $currentPage)
                .tag(2)  // Tag used for identifying this view in the TabView
        }
        // Styles the TabView to behave like pages with swipe-to-navigate functionality
        .tabViewStyle(PageTabViewStyle())
        // Intended to set a background image, though the image name isn't currently provided
        .background(Image("").opacity(0))
        // Ensures the view extends beyond the safe area, providing a full-screen experience
        .edgesIgnoringSafeArea(.all)
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
                    .fill(index == current ? Color(red: 1, green: 0.66, blue: 0.14) : Color.gray)
                    // Adjust the size of the circle based on whether it represents the current page
                    .frame(width: index == current ? 7 : 8, height: index == current ? 7 : 8)
                    // Apply a smooth animation to the circle's transition (e.g., when it changes size or color)
                    .animation(.easeInOut)
            }
        }
    }
}

