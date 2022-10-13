//
//  OnboardSet.swift
//  MarkBank
//
//  Created by user220156 on 9/13/22.
//

import Foundation

class OnboardSet{
    var cards: [OnboardCard] = []
    
    func newCard(image:String,title:String,  description:String, tag:Int){
        cards.append(OnboardCard(title: title, image: image, description: description, tag: tag))
    }
}

extension OnboardSet{
    static func previewSet() -> OnboardSet{
        let onboardSet = OnboardSet()
        onboardSet.newCard( image:"overdraft", title:"Overdraft", description: "Get instant overdraft when you use your card actively", tag: 0)
        onboardSet.newCard(image:"bank", title:"Bank", description: "Get monthly free transfer, a free debit card & smarter budgeting", tag: 1)
        onboardSet.newCard(image:"save", title:"Save", description: "Earn more interest on your savings & save automatically when you spend", tag: 2)
        onboardSet.newCard( image:"overdraft", title:"Overdraft", description: "Get instant overdraft when you use your card actively", tag: 3)
        
        return onboardSet
    }
}
