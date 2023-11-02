//
//  AppDelegate.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//
import UIKit
import Firebase
import GoogleSignIn
import FacebookCore

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        // Facebook initialization
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let googleHandled = GIDSignIn.sharedInstance.handle(url)
        
        let fbHandled = ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
        return googleHandled || fbHandled
    }
}

