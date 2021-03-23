//
//  Address+CoreDataProperties.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 20/03/21.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?

}

extension Address : Identifiable {

}
