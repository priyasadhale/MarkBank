//
//  Register.swift
//  MarkBank-LoginRegistration
//
//  Created by user220156 on 9/21/22.
//

import SwiftUI

struct Register: View {
    @State var username = ""
    @State var password = ""
    @State var confirmPass = ""
    @Binding var isShowing:Bool
    
    var body: some View{
        ZStack(alignment: .topLeading){
        /*
            Rectangle()
                .fill(Color.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            */
            register
            Button(action: {
                self.isShowing.toggle()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }).padding()
        }
        .navigationBarHidden(true)
    }
    
    var register: some View {
       
        
        return ZStack{
            VStack{
                Spacer()
                Text("REGISTER")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Create your new account")
                    .foregroundColor(.gray)
                
                TextField("Email", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .padding()
                    
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .privacySensitive()
                    .padding()
                
                SecureField("Confirm Password", text: $confirmPass)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .privacySensitive()
                    .padding()
                HStack{
                    Spacer()
                    Button("CREATE"){
                        if password != confirmPass{
                            self.password = ""
                            self.confirmPass = ""
                        }
                        print("CREATE button pressed!!!!")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    //Spacer()
                }
                
                
                Spacer()
            }//end of Vstack
        }// end of zstack
    }
}
/*
struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
*/
