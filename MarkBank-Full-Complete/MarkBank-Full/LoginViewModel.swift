//
//  LoginViewModel.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/13/22.
//

import Foundation
import SwiftUI

extension LoginView{
    class ViewModel: ObservableObject{
        @AppStorage("AUTH_KEY") var authenticated = false {
                   willSet{objectWillChange.send()}
               }
               // the text will be pre-populated with the data. can be used
               //for initial debugging, later remove while actual production
               
               @AppStorage("USER_KEY") var username = ""
               @Published var password = "" // we will not store any sensitive info
               @Published var invalid: Bool = false
               
               // we will compare the input with hardcoded values for username and password
               private var sampleUser = "username"
               private var samplePassword = "password"
               
               init(){
                   print("Currently logged on: \(authenticated)")
                   print("Current user: \(username)")
               }
               
               func toggleAuthentication(){
                   self.password = ""
                   withAnimation{
                       authenticated.toggle()
                   }
               } // end of toggleAuthentication
               
               func authenticate(){
                   guard self.username.lowercased() == sampleUser &&
                   self.password.lowercased() == samplePassword else {
                       self.invalid = true
                       return
                   }
                   toggleAuthentication()
                  
               }// eof authenticate
               
               func logOut(){
                   toggleAuthentication()
               }
               
               func logPressed(){
                   print("Button Pressed!!!")
               }
        
    }
}
