//
//  Company+CoreDataProperties.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 20/03/21.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var cathphrase: String?

}

extension Company : Identifiable {

}
