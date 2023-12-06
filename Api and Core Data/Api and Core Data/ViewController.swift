//
//  ViewController.swift
//  Api and Core Data
//
//  Created by Fenris GMBH on 01/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtFatherName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSaveData(_ sender: Any) {
        let dict : [String : Any] = ["id":txtId.text!,"name":txtName.text!,"fathername":txtFatherName.text!]
        CoreDataFunctions.shareInstance.get(object: dict as! [String : String])
        print("Getting Here")
        
        
        fetchDataAndPrint()
    }
    
    func fetchDataAndPrint() {
           let students = CoreDataFunctions.shareInstance.fetchData()

           if let students = students, !students.isEmpty {
               for student in students {
                   print("ID: \(student.id ?? ""), Name: \(student.name ?? ""), Father Name: \(student.fathername ?? "")")
               }
           } else {
               print("No data found in Core Data.")
           }
       }
   
}

