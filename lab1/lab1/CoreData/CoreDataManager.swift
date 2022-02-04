//
//  CoreDataManager.swift
//  lab1
//
//  Created by Adam Bokun on 8.11.21.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    private override init() {
        super.init()
        applicationLibraryDirectory()
    }
    
    static let _shared = CoreDataManager()
    
    class func shared() -> CoreDataManager{
        return _shared
    }
    
    private lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1])
        return urls[urls.count-1]
    }()
    
    private func applicationLibraryDirectory() {
        print(applicationDocumentsDirectory)
        if let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
            print(url.absoluteString)
        }
    }
    // MARK: - Core Data stack
    
    lazy var managedObjectContext = {
        
        return self.persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func prepare(dataForSaving: [Events]){
        _ = dataForSaving.map{self.createEntityFrom(events: $0)}
        saveData()
    }
    
    private func createEntityFrom(events: Events) -> EventItem?{
        let eventItem = EventItem(context: self.managedObjectContext)
        eventItem.type = events.type
        eventItem.login = events.actor.login
        eventItem.name = events.repo.name
        eventItem.avatar_url = events.actor.avatar_url
        eventItem.created_at = events.created_at
        
        return eventItem
    }
    
    func saveData(){
        
        let context = self.managedObjectContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveDataInBackground() {
        persistentContainer.performBackgroundTask { (context) in
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }
    
    func fetchAllData() -> [Events] {
        do {
            let fetchRequest: NSFetchRequest<EventItem>
            fetchRequest = EventItem.fetchRequest()

            let context = persistentContainer.viewContext
            let objects = try context.fetch(fetchRequest)
            let fetchResult = objects.compactMap { event -> Events in
                return Events(type: event.type ?? "",
                              login: event.login ?? "",
                              avatar: event.avatar_url ?? "",
                              name: event.name ?? "",
                              createdAt: event.created_at ?? "")
                }
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
