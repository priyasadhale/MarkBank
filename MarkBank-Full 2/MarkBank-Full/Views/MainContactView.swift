//
//  MainView.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/13/22.
//

import SwiftUI
import CoreData

struct MainContactView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
      //MARK: get the data from database, use @fetchrequest
      
      @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var contact: FetchedResults<People>
      
      @State private var showingAddContactsView = false
      
      var body: some View {
          NavigationView{
              VStack(alignment: .leading){
                  List{
                      ForEach(contact){contact in
                          NavigationLink(destination:
                           //MARK: sometimes string interpolation can not handle optionals and hence you need to use nil coalescing as below
                                         EditContactView(contact:contact)){
                              VStack(alignment:.leading, spacing: 20){
                                  Text(contact.name!)
                                  //Spacer()
                                  Text(contact.phone!)
                              }
                          }
                      }// end of For each loop
                      .onDelete(perform: deleteContact)
                  }// end of list
                  .listStyle(.plain)
                  
              }// end of vstack
              .navigationTitle("My Contacts")
              .toolbar{
                  ToolbarItem(placement: .navigationBarTrailing){
                      Button{
                          showingAddContactsView.toggle()
                      } label: {
                          Label("Add Contact", systemImage: "plus.circle")
                      }
                  }
                  ToolbarItem(placement: .navigationBarLeading){
                      EditButton()
                  }
              }
              .sheet(isPresented:  $showingAddContactsView){
                  AddContactView()
              }
          }
          .navigationViewStyle(.stack)
      }
      private func deleteContact(offets: IndexSet){
          // pass
          withAnimation
          {
              offets.map{contact[$0]}
                  .forEach(managedObjectContext.delete)
              DataController().save(context: managedObjectContext)
          }
      }
      }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainContactView()
    }
}
