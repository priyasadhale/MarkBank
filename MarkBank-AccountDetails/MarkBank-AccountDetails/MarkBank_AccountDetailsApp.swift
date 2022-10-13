//
//  MarkBank_AccountDetailsApp.swift
//  MarkBank-AccountDetails
//
//  Created by user220156 on 10/4/22.
//

import SwiftUI

@main
struct MarkBank_AccountDetailsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()                
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
