//
//  Users+CoreDataProperties.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 20/03/21.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var email: String?
    @NSManaged public var toCompany: Company?
    @NSManaged public var toAddress: Address?

}

extension Users : Identifiable {

}
