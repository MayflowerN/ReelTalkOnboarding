//
//  ReelTalkOnboardingApp.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/3/23.
//

import SwiftUI

@main
struct ReelTalkOnboardingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {

            Splash_1()
        }
    }
}