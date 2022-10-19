//
//  MarkBank_FullApp.swift
//  MarkBank-Full
/**
 
 
 */

//
//  Created by user220156 on 10/12/22.
//

import SwiftUI
// define the observable class to check whether to show onboarding or login
class AppState: ObservableObject{
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool){ //remember? every class must have init method
        self.hasOnboarded = hasOnboarded
    }
}

/**
 the main view will toggle based on the value of hasOnboarded. if it is true means
 onboarding screens are done with the display, then switch to login view
 */
@main
struct MarkBank_FullApp: App {
    @StateObject var appState = AppState(hasOnboarded: false)
    
    var body: some Scene {
        WindowGroup {
            if(appState.hasOnboarded){
                LoginView()
                    .environmentObject(appState)
            } else {
                OnboardingFlowView()
                    .environmentObject(appState)
            }
            
        }
    }
}
