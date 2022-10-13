//
//  OnBoardingScreens.swift
//  MarkBank
//
//  Created by user220156 on 9/13/22.
//

import SwiftUI

struct OnBoardingScreens: View {
    var onboardSet:OnboardSet //= OnboardSet.previewSet()
    @Binding  var currentStep: Int
        
    var body: some View {
        VStack {
                         
                    TabView{
                        
                        //ForEach(onboardSet.cards){card in
                            //Text("\(onboardSet.cards.count) \(card.description)")
                            //Text("\(card.title) - \(card.description)")
                           // OBCardView(card: card, currentStep: $currentStep)
                            
                            let _ = Self._printChanges()
                        //}
                        
                        // end of for loop
                    }// end of tabview
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                HStack{
                    ForEach(0..<onboardSet.cards.count, id: \.self){ it in
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
                .padding(.bottom, 20)
            Button(action: {
                if currentStep < onboardSet.cards.count - 1 {
                    currentStep += 1
                }
            }) {
                Text(currentStep < onboardSet.cards.count - 1 ? "Next" : "Get Started")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                
            }
            .buttonStyle(PlainButtonStyle())
        }
     }
}

struct OnBoardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreens(onboardSet: OnboardSet.previewSet(), currentStep: .constant(+1))
    }
}
