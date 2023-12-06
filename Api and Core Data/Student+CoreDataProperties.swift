//
//  Student+CoreDataProperties.swift
//  Api and Core Data
//
//  Created by Fenris GMBH on 01/12/2023.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var fathername: String?
    @NSManaged public var id: String?

}

extension Student : Identifiable {

}
