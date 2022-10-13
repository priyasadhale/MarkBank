//
//  ContentView.swift
//  MarkBank
//
//  Created by user220156 on 9/7/22.
//

import SwiftUI
/**
 Step 2: create a structure to match the screen layout
 */
struct OnboardingStep{
    let image: String
    let title: String
    let description: String
}

struct ContentView1: View {
    var body: some View {
        VStack{
            Image("bank")
                .resizable()
                .clipShape(Circle())
                .frame(width: 250, height: 250)
                .padding(.bottom, 30)
            
               Text("Bank")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .padding(.bottom, 30)
            
                Text("Get monthly free transfer, a free debit card & smarter budgeting")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
