//
//  OBCardView.swift
//  MarkBank
//
//  Created by user220156 on 9/13/22.
//

import SwiftUI

struct OBCardView: View {
    let card: OnboardCard

    var body: some View {
        VStack {
          /*
                HStack{
                    Button(action: {
                        currentStep = OnboardSet.previewSet().cards.count - 1
                        //self.currentStep = onBoardingSets.count - 1
                    }){
                        Image(systemName: "arrow.backward")
                    }
                    Spacer()
                }// end of HStack
               */
                    TabView{
                        
                            VStack{
                                Image(card.image)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 250, height: 250)
                                   
                             
                                Text(card.title)
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                  
                                
                                Text(card.description)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 32)
                        }// end of TabView -> VStack
                    }
                    }// end of tabview
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                }
          }

struct OBCardView_Previews: PreviewProvider {
    static let onboardSet = OnboardSet.previewSet()
     
    static var previews: some View {
        OBCardView(card: onboardSet.cards[0])
    }
}
