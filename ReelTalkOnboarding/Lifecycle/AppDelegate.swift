//
//  AppDelegate.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    // Function called when the app has finished launching.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Iterate through all font family names available in the app.
        for familyName in UIFont.familyNames {
            print("Font Family Name: \(familyName)")
            
            // Iterate and print all the specific font names within each font family.
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("    Font Name: \(fontName)")
            }
        }
        
        return true
    }
}
