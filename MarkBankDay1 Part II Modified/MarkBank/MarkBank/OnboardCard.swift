//
//  OnboardCard.swift
//  MarkBank
//
//  Created by user220156 on 9/13/22.
//

import Foundation

struct OnboardCard: Identifiable, Equatable{
    let id = UUID()
    var title:String
    var image:String
    var description:String
    var tag:Int
    
}
