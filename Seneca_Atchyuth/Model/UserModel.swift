//
//  UserModel.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 19/03/21.
//

import Foundation
import UIKit

class UserModel {

    var email = String()
    var firstName = String()
    var lastName = String()
    var avatarString = String()
    
    init(userDictionary: Dictionary<String, Any>) {
      
        if let emailOfUser = userDictionary["email"] as? String, let firstNamelOfUser = userDictionary["first_name"] as? String, let lastNameOfUser = userDictionary["last_name"] as? String, let avatarOfUser = userDictionary["avatar"] as? String  {
          
            self.email = emailOfUser
            self.firstName = firstNamelOfUser
            self.lastName = lastNameOfUser
            self.avatarString = avatarOfUser
            
        }
    }
}
