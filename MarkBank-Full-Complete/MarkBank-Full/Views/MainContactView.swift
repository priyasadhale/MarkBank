//
//  MainView.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/13/22.
//

import SwiftUI
import CoreData

struct MainContactView: View {
    @EnvironmentObject var appState: AppState
    
    //@Binding var showMainContactView: Bool
    
      var body: some View {
          NavigationView{
              TabView{
                  ContactsView()
                      .tabItem{
                          Label("Contacts", systemImage: "person.crop.circle.fill")
                      }
                      .tag(0)
                  FundTransferView()
                      .tabItem{
                          Label("Funds Transfer", systemImage: "arrow.left.arrow.right.square.fill")
                      }
                      .tag(1)
              }
              
          }
          .navigationViewStyle(.stack)
      }
      
    }

/*
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView{
            
            MainContactView(showMainContactView: .constant(true))
       //}
       // .navigationTitle("")
    }
}
*/

struct FundTransferView: View{
    @State var fromUser = ""
    @State var toUser = ""
    @State var amount = ""
    @State var presentAlert = false
    
    var body:some View{
        VStack(spacing:12){
            TextField("From", text: $fromUser)
            TextField("To", text: $toUser)
            TextField("Amount", text: $amount)
            Button("Transfer Funds"){
                presentAlert.toggle()
            }
            .buttonStyle(.bordered)
            .alert("Funds Transferred", isPresented: $presentAlert) {
                ContactsView()
            }
        }
        .padding()
    }
}

struct ContactsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
      //MARK: get the data from database, use @fetchrequest
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var contact: FetchedResults<People>
  
    @State  var showingAddContactsView = false
        
    var body: some View {
        

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
    
     func deleteContact(offets: IndexSet){
        // pass
        withAnimation
        {
            offets.map{contact[$0]}
                .forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }}

struct Previews_MainContactView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
