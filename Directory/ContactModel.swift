//
//  ContactModel.swift
//  Directory
//
//  Created by oktay on 26.02.2023.
//

import Foundation
import UIKit


struct ContactModel {
    
    let firstName : String
    let lastName : String
    let phone : String
    let email  : String
    let street : String
    let city : String
    let state : String
    let zip : String
    let image : UIImage?
    var favorite :  Bool
    
    
}

extension ContactModel {
    
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let phone = "phoneNumber"
        static let email = "email"
        static let street = "streetAddress"
        static let city = "city"
        static let state = "state"
        static let zip = "zip"
        static let image = "avatarName"
        
    }
    init?(data : [String : String]) {
        
        
        guard let firstNameData = data[Key.firstName] ,
              let lastNameData = data[Key.lastName] ,
              let phoneData = data[Key.phone] ,
              let emailData = data[Key.email] ,
              let streetData = data[Key.street] ,
              let cityData = data[Key.city] ,
              let stateData = data[Key.state] ,
            let zipData = data[Key.zip] else { return nil}
        
        firstName = firstNameData
        lastName = lastNameData
        phone = phoneData
        email = emailData
        street = streetData
        city = cityData
        state = stateData
        zip = zipData
        
        if let imageData = data[Key.image] {
            image = UIImage(named: imageData)
        } else {
            image = nil
        }
        favorite = false
        
    }
    
    
}

