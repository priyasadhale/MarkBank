//
//  EditContactView.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/13/22.
//

import SwiftUI

struct EditContactView: View {
    @Environment (\.managedObjectContext) var managedObjectContext
       @Environment(\.dismiss) var dismiss
       
       var contact: FetchedResults<People>.Element
       
       @State private var name = ""
       @State private var phone = ""
       @State private var image = ""
       
       var body: some View {
           Form{
               Section{
                   VStack(spacing:12) {
                       TextField("\(contact.name!)", text: $name)
                       TextField("\(contact.phone!)", text: $phone)
                           .onAppear{
                               name = contact.name!
                               phone = contact.phone!
                               image = contact.image!
                           }
                       .padding()
                   }//end of vstack
                   HStack{
                       Spacer()
                       Button("Submit"){
                           DataController().editContact(contact: contact, image: image, name: name, phone: phone, context: managedObjectContext)
                           dismiss()
                       }
                       Spacer()
                   }
               }
           }
       }}

struct EditContactView_Previews: PreviewProvider {
    static var previews: some View {
        EditContactView()
    }
}
