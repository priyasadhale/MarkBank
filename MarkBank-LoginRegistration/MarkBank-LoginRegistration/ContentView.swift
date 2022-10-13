//
//  Login.swift
//  MarkBank-LoginRegistration
//
//  Created by user220156 on 9/21/22.
//

import SwiftUI

struct ContentView: View {
   @StateObject var vm = ViewModel()
      
    var body: some View{
                   
        ZStack{
           
        if vm.authenticated{
            VStack(spacing: 20){
                Text("Welcome back **\(vm.username.lowercased())**!")
                Text("Today is: **\(Date().formatted(.dateTime))**")
                Button("Log Out", action: vm.logOut)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        }
        else{
            
            ZStack{
                VStack{
                    Spacer()
                    Text("Log in")
                        .foregroundColor(.pink)
                        .font(.system(size: 50, weight: .medium, design: .rounded))
                    TextField("Username", text: $vm.username)
                        .textFieldStyle(.roundedBorder)
                        
                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    
                    HStack{
                        Spacer()
                        Button("Forgot Password?", action: vm.logPressed)
                            .tint(.red.opacity(0.8))
                        Spacer()                        
                        Button("Log in", action: vm.authenticate)
                            .buttonStyle(.bordered)
                            .font(.title2)
                        Spacer()
                    }// eof HStack
                    Spacer()
                }// end of VStack
                .alert("Acccess Denied", isPresented: $vm.invalid) {
                    Button("Dismiss", action: vm.logPressed)
                }
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x: 0, y: 850))
        }
    }
 }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
