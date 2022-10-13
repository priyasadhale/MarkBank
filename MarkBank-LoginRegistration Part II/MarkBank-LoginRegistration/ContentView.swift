//
//  ContentView.swift
//  MarkBank-LoginRegistration
//
//  Created by user220156 on 9/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        Home()
    }
}

struct Home: View{
    @State var isShowing = false
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink(
                    destination: Register(isShowing: self.$isShowing),
                    isActive: self.$isShowing,
                    label: {
                        Text("")
                    }).hidden()
                Login(isShowing: self.$isShowing)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
