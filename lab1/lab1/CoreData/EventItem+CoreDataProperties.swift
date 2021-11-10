//
//  EventItem+CoreDataProperties.swift
//  lab1
//
//  Created by Adam Bokun on 8.11.21.
//
//

import Foundation
import CoreData


extension EventItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventItem> {
        return NSFetchRequest<EventItem>(entityName: "EventItem")
    }

    @NSManaged public var type: String?
    @NSManaged public var login: String?
    @NSManaged public var avatar_url: String?
    @NSManaged public var name: String?
    @NSManaged public var created_at: String?

}

extension EventItem : Identifiable {

}
