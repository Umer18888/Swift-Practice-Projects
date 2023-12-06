//
//  CoreDataFunctions.swift
//  Api and Core Data
//
//  Created by Fenris GMBH on 01/12/2023.
//


import UIKit
import Foundation
import CoreData

class CoreDataFunctions {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var shareInstance = CoreDataFunctions()
    func get(object:[String:String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.id = object["id"]
        student.name = object["name"]
        student.fathername = object["fathername"]
        
        do {
            try context?.save()
        }catch {
            print("Data is not saved")
        }
        
    }
    
    func fetchData() -> [Student]? {
          let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()

          do {
              // Execute the fetch request
              let students = try context?.fetch(fetchRequest)
              return students
          } catch {
              print("Failed to fetch data from Core Data: \(error)")
              return nil
          }
      }

}
