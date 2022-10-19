//
//  PageView.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/12/22.
//

import SwiftUI

struct PageView: View {
    var page: Page
      
      var body: some View {
          VStack(spacing: 10) {
              Image("\(page.imageUrl)")
                  .resizable()
                  .scaledToFit()
                  .frame(width:150, height: 150)
                  .clipShape(Circle())
                  .padding()
              
              VStack {
                 
                  HStack{
                          
                          Rectangle()
                              .frame(width:100,height: 50)
                              .foregroundColor(.gray)
                              .padding(.leading, 50)
                          
                              Text(page.name)
                                  .font(.title)
                                 
                          Spacer()
                  }
                  .padding()
                  Text(page.description)
                      .font(.subheadline)
                                  
              }
              
          }
      }
    
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
