//
//  Users.swift
//  CoreDataCustomObject
//
//  Created by Bjarte Skjørestad on 29/06/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

import UIKit
import CoreData

@objc(Users) // make avilable for objective-c (needed for core data)
class Users: NSManagedObject {
   
    @NSManaged var password: String
    @NSManaged var username: String
    
    func toString() -> String {
        return "The username is \(username) and their password is \(password)"
    }
    
    func addFunnyPrefix(prefix: String) {
        username = prefix + username
    }
    
    func validPassword(inputPassword: String) -> Bool {
        return inputPassword == password
    }
    
}
