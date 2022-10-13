//
//  AddContactView.swift
//  MarkBank-AccountDetails
//
//  Created by user220156 on 10/4/22.
//

import SwiftUI

struct AddContactView: View {
    @Environment (\.managedObjectContext) var managedObjectContext
    // MARK: dismiss will close the current view and take us back to the
    // main navigation view
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var image = ""
    @State private var phone = ""
    
    var body: some View {
        Form{
            Section{
                VStack(spacing:20) {
                    TextField("Select Photo", text: $image)
                    TextField("Contact Name", text: $name)
                    TextField("Phone", text: $phone)
                        .keyboardType(.numberPad)
                } // end of vstack
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(.system(size: 20, weight: .medium, design: .default))
                HStack{
                    Spacer()
                    Button("Add Contact"){
                        DataController().addContact(image: image, name: name, phone: phone, context: managedObjectContext)
                        dismiss()
                    }
                    Spacer()
                }// end of hstack
            }
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
