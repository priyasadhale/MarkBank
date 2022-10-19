//
//  LoginView.swift
//  MarkBank-Full
//   // inspiration: "https://www.youtube.com/watch?v=aVO4EVGvQcw"
//  Created by user220156 on 10/12/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var vm = ViewModel()
    
    @State var isLoginMode = false
    @State var username = ""
    @State var password = ""
    @State var confirmPass = ""

    var body: some View {
        NavigationView {
            
            ScrollView {
                if vm.authenticated{
                            VStack(spacing: 20){
                                Text("Welcome back **\(vm.username.lowercased())**!")
                                Text("Today is: **\(Date().formatted(.dateTime))**")
                                Button("Log Out", action: vm.logOut)
                                    .tint(.red)
                                    .buttonStyle(.bordered)
                            }
                        }
                
                else {
                    VStack(spacing: 16) {
                        Picker(selection: $isLoginMode, label: Text("Picker here")) {
                            Text("Login")
                                .tag(true)
                            Text("Create Account")
                                .tag(false)
                        }.pickerStyle(SegmentedPickerStyle())

                        if !isLoginMode {
                            Button {

                            } label: {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                            }
                            Group{
                                TextField("Username", text: $username)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.emailAddress)
                                          
                                SecureField("Password", text: $password)
                                    .textFieldStyle(.roundedBorder)
                                    .textInputAutocapitalization(.never)
                                    .privacySensitive()
                       
                                SecureField("Confirm Password", text: $confirmPass)
                                    .textFieldStyle(.roundedBorder)
                                    .textInputAutocapitalization(.never)
                                    .privacySensitive()
                            }
                            .padding()
                            .background(.white)
                            
                        }
// show only username and password if user wants to login
                        else {
                            Group {
                                TextField("Username", text: $vm.username)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .textFieldStyle(.roundedBorder)
                                
                                SecureField("Password", text: $vm.password)
                                    .textFieldStyle(.roundedBorder)
                                    .textInputAutocapitalization(.never)
                                    .privacySensitive()
                            }
                            .padding(12)
                        .background(Color.white)
                        }

                        Button {
                            handleAction()
                        } label: {
                            HStack {
                                Spacer()
                                Text(isLoginMode ? "Log In" : "Create Account")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 14, weight: .semibold))
                                Spacer()
                            }.background(Color.blue)

                        }
                    }
                    .padding()
                }

            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
        }
    }

    private func handleAction() {
        if isLoginMode {
            vm.authenticate()
        } else {
            guard password == confirmPass else {
                self.confirmPass = ""
                self.password = ""
                return
            }
        }
    } // end of handleAction
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
