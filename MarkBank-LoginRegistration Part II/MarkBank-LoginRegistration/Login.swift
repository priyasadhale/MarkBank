//
//  Login.swift
//  MarkBank-LoginRegistration
//
//  Created by user220156 on 9/21/22.
//

import SwiftUI

struct Login: View {
    @Binding var isShowing:Bool
    @State var username = ""
    @State var password = ""
    @State var invalid = false
    @AppStorage("AUTH_KEY") var auth = false

    var body: some View{
        login
    }
        
    
    var login: some View{
       
        return ZStack{
               VStack{
                    Spacer()
                    Text("Log in")
                        .foregroundColor(.pink)
                        .font(.system(size: 50, weight: .medium, design: .rounded))
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    HStack{
                        Spacer()
                        
                        Button("Forgot Password?", action: {
                            print("user forgot the password")
                        })
                            .tint(.red.opacity(0.8))
                        
                        Spacer()
                        
                        Button("Log in", action: authenticated)
                            .buttonStyle(.bordered)
                            .font(.title2)
                        Spacer()
                        
                        Text("Sign Up")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .onTapGesture {
                                self.isShowing.toggle()
                            }
                    }// eof HStack
                    Spacer()
                }// end of VStack
               /*.alert("Acccess Denied", isPresented: self.$isShowing) {
                    Button("Dismiss", action: {
                        print("Button Pressed")
                    })
                
                }*/
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x: 0, y: 850))
        }
    func authenticated(){
        
            print("Checking username and password")
            guard self.username.lowercased() == "username" &&
                self.password.lowercased() == "password" else {
                self.invalid = true
                return
            }
            toggleAuthenticate()
        _ = LoggedInView(isShowing: $isShowing)
        
    }
    
    func toggleAuthenticate(){
        self.password = ""
        withAnimation{
            auth.toggle()
        }
    }
    func logOut(){
        toggleAuthenticate()
    }
    
    }
  
struct LoggedInView: View{
    @Binding var isShowing:Bool
    
    var body: some View{
        var login = Login(isShowing: $isShowing)
        if login.auth{
            VStack(spacing: 20){
                Text("Welcome back **\(login.username.lowercased())**")
                Text("Today is **\(Date().formatted(.dateTime))**")
                Button("Log out",action : login.logOut)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        }
        
    }
    
    
}

/*
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
 */
