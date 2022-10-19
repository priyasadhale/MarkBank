//
//  PageModel.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/12/22.
//

import Foundation


struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Bank", description: "Get monthly free transfer, a free debit card & smarter budgeting", imageUrl: "bank", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Bank", description: "Get monthly free transfer, a free debit card & smarter budgeting.", imageUrl: "bank", tag: 0),
        Page(name: "Save", description: "Earn more interest on your savings & save automatically when you spend", imageUrl: "save", tag: 1),
        Page(name: "Overdraft", description: "Get instant overdraft when you use your card actively" , imageUrl: "overdraft", tag: 2)
    ]
}
