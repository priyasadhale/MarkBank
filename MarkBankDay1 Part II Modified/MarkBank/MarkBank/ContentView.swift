//
//  ContentView.swift
//  MarkBank
//
//  Created by user220156 on 9/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentStep = 0
    var onboardSet = OnboardSet.previewSet()
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
           
        TabView(selection: $currentStep){
            
            ForEach(onboardSet.cards, id: \.id){card in
                VStack{
                    Spacer()
                    //Text("\(card.title) \(card.description)")
                    OBCardView(card: card)
                    Spacer()
                    
                    if card == onboardSet.cards.last{
                        Button("Register", action: goToZero)
                            .buttonStyle(.borderedProminent)
                    }
                    else{
                        Button("Next", action: incrementPage)
                            .buttonStyle(.borderedProminent)
                    }
                    Spacer()
                    
                    let _ = Self._printChanges()
                }
                .tag(card.tag)
            }
            .animation(.easeInOut, value: currentStep)
            // end of for loop
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .tabViewStyle(PageTabViewStyle())
            .onAppear{
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }
        }
    func incrementPage(){
        currentStep += 1
    }
    
    func goToZero(){
        currentStep = 0
    }
}
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
