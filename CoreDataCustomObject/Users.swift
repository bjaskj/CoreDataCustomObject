//
//  Users.swift
//  CoreDataCustomObject
//
//  Created by Bjarte Skjørestad on 29/06/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

import UIKit
import CoreData

class Users: NSManagedObject {
   
    @NSManaged var password: String
    @NSManaged var username: String
    
}
