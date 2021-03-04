//
//  LiveFullyApp.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/02/21.
//

import SwiftUI

@main
struct LiveFullyApp: App {
    var body: some Scene {
        WindowGroup {
            if isUserConfigured() {
            HomeView()
                .background(Color("background"))
            } else {
                OnboardingView()
                    .background(Color("background"))
            }
            
        }
    }
    
    func isUserConfigured() -> Bool{
        return LiveFullyDefaults.userName != nil && LiveFullyDefaults.dateOfBirth > 0 && LiveFullyDefaults.ageGoal > 0
    }
    
}
