//
//  ContentView2.swift
//  MarkBank
//
//  Created by user220156 on 9/7/22.
//

import SwiftUI
/**
 Step 3: Create the sample data to show on screen
 */

struct OnboardingSet{
    let image: String
    let title: String
    let description: String
}

private let onBoardingSet : [OnboardingSet] = [
    OnboardingSet( image:"bank", title:"Bank", description: "Get monthly free transfer, a free debit card & smarter budgeting"),
    OnboardingSet( image:"save", title:"Save", description: "Earn more interest on your savings & save automatically when you spend"),
   OnboardingSet( image:"overdraft", title:"Overdraft", description: "Get instant overdraft when you use your card actively")
]

struct ContentView2: View {
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

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
