//
//  CoreDataManager.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 20/03/21.
//

import Foundation
import CoreData
import UIKit

class CoreDataManger {
    
    
    static let sharedinstance: CoreDataManger = {
       let instance = CoreDataManger()
        return instance
    }()
    
    func fetchRecors() -> [Users]  {
        let mainContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        var userArray = [Users]()
        do {
           
        let userecords = try mainContext.fetch(fetchRequest)
            for userrecord in userecords as! [Users] {
                
                userArray.append(userrecord)
            }
        } catch {
            
        }
        return userArray
    }
   
}
