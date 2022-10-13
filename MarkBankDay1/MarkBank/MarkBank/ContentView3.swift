//
//  ContentView3.swift
//  MarkBank
//
//  Created by user220156 on 9/7/22.
//

import SwiftUI


struct OnboardingSets{
    let image: String
    let title: String
    let description: String
}

private let onBoardingSets : [OnboardingSet] = [
    OnboardingSet( image:"bank", title:"Bank", description: "Get monthly free transfer, a free debit card & smarter budgeting"),
    OnboardingSet( image:"save", title:"Save", description: "Earn more interest on your savings & save automatically when you spend"),
   OnboardingSet( image:"overdraft", title:"Overdraft", description: "Get instant overdraft when you use your card actively")
]

struct ContentView3: View {
    
    @State private var currentStep = 0
    
    init(){
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        VStack {
            
            HStack{
                Button(action: {
                    self.currentStep = onBoardingSets.count - 1
                }){
                    Image(systemName: "arrow.backward")
                }
                Spacer()
            }// end of HStack
           
                TabView(selection: $currentStep){
                    ForEach(0..<onBoardingSets.count, id:\.self) { item in
                        
                        VStack{
                            Image(onBoardingSets[item].image)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 250, height: 250)
                               
                            
                            Text(onBoardingSets[item].title)
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                              
                            
                            Text(onBoardingSets[item].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                    }// end of TabView -> VStack
                        .tag(item)
                    }// end of for loop
                }// end of tabview
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            HStack{
                ForEach(0..<onBoardingSets.count){ it in
                    if it == currentStep{
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(10)
                            .foregroundColor(.purple)
                    }else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            }
        //}
        
        Button(action: {
            if self.currentStep < onBoardingSets.count - 1 {
                self.currentStep += 1
            }
        }) {
            Text(currentStep < onBoardingSets.count - 1 ? "Next" : "Get Started")
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(16)
                .padding(.horizontal, 16)
                .foregroundColor(.white)
            
        }
        .buttonStyle(PlainButtonStyle())
        
    //}
 }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView3()
            ContentView3()
                .preferredColorScheme(.dark)
        }
    }
}
