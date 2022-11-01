///
/// MarkBank_FullApp.swift
///  MarkBank-Full
/**
 
 
 */

//
///MARK:  Created by Priya Sadhale on 10/12/22.
//

import SwiftUI
// define the observable class to check whether to show onboarding or login

/**
 One of the elegant way to navigate to the screens programmatically is use of
 enum in SwiftUI.
 Below 'Screens' enum takes 3 values: none, onboard and loggedIn. Initially, nothing is set, later start with onboarding. After onboarding screens, user wants to login and hence the next value 'loggedIn' will be used.
 */
enum Screens{
    case onboarded
    case loggedIn
    case none
}


/// The class AppState is declared as ObservableObject so that the published value is available throughout the screens
///
class AppState: ObservableObject{
    @Published var screen:Screens = .none //hasOnboarded: Bool
    
    /// ## Overview
    
        
    /// class initializer
    /// - Parameter screen: The parameter 'screen' takes any value of none, loggedIn & onboard to navigate between the screens
    ///
    init(screen: Screens){ //remember? every class must have init method
        self.screen = screen
        //self.hasOnboarded = hasOnboarded
    }
}

/**
class LoadScreen: ObservableObject{
    @Published var hasLoggedIn: Bool
    
    init(hasLoggedIn: Bool){
        self.hasLoggedIn = hasLoggedIn
    }
}
*/
/**
 the main view will toggle based on the value of hasOnboarded. if it is true means
 onboarding screens are done with the display, then switch to login view
 */
@main
struct MarkBank_FullApp: App {
    @StateObject var appState = AppState(screen: .none)
    //@StateObject var loadScreen = LoadScreen(hasLoggedIn: false)
    
    @StateObject var datacontroller = DataController()
    
    var body: some Scene {
        WindowGroup {
          //  if(appState.hasOnboarded && !loadScreen.hasLoggedIn){
            //MARK: check the value to switch between different screens
            /// - Note: to switch screens the value of enum is passed between the views using environmentObject
            ///
            if appState.screen == .onboarded{
                LoginView()
                    .environmentObject(appState)
                    .environment(\.managedObjectContext, datacontroller.container.viewContext)
                
                
                
            } else if appState.screen == .loggedIn{
                MainContactView()
                    .environmentObject(appState)
                    .environment(\.managedObjectContext, datacontroller.container.viewContext)
                
            } else {
                OnboardingFlowView()
                    .environmentObject(appState)
            }
            
        }
    }
}
