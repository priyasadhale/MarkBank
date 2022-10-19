//
//  DataController.swift
//  MarkBank-Full
//
//  Created by user220156 on 10/13/22.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    //MARK: the NSPersistentContainer handles the creation of the Core Data stack and offers access to the NSManagedObjectContext as well as a number of convenience methods
    let container = NSPersistentContainer(name: "AccountModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
            
        }
    } // end of init
    
    //MARK: save data
    // The managed object context (NSManagedObjectContext) is the object that your application will interact with the most, and therefore it is the one that is exposed to the rest of your application. Think of the managed object context as an intelligent scratch pad.
    // MARK: The creation of NSManagedObject instances does not guarantee their persistence. After you create an NSManagedObject instance in your managed object context, explicitly save that context to persist those changes to your persistent store.
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved")
        } catch{
            print("Couldn't save the data")
        }
    } // end of save()
    
    func addContact(image: String, name: String, phone: String, context: NSManagedObjectContext){
        
        let contact = People(context: context)
        contact.id = UUID()
        contact.name = name
        contact.phone = phone
        contact.image = image
        
        save(context: context)
    }// end of addContact
    
    //MARK: use shift + command/win + k to clean the cache if you are not able to see the entity
    
    func editContact(contact: People, image: String, name: String, phone: String, context:NSManagedObjectContext){
        contact.phone = phone
        contact.image = image
        contact.name = name
        
        save(context: context)
    }
}
