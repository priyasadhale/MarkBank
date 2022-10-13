//
//  ContentView.swift
//  MarkBank
//
//  Created by user220156 on 9/7/22.
//
/**:
 Step 1: create the layout with the hard coding the things
  */
import SwiftUI
struct ContentView0: View {
    
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
struct ContentView0_Previews: PreviewProvider {
    static var previews: some View {
        ContentView0()
    }
}
