//
//  MainViewController.swift
//  CoreDataCustomObject
//
//  Created by Bjarte Skjørestad on 29/06/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet var textPassword: UITextField!
    @IBOutlet var textUsername: UITextField!
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        return appDelegate.managedObjectContext
    }
    
    func getEntity(context: NSManagedObjectContext) -> NSEntityDescription! {
        return NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
    }
    
    @IBAction func buttonLoadClicked() {
        let context = getContext()
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", textUsername.text!)
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if results.count > 0 {
            for user: AnyObject in results {
                var thisUser = user as Users
                println(thisUser.toString())
                thisUser.addFunnyPrefix("👍 ")
                println(thisUser.toString())
            }
            return
        }
        
        println("No results found")
        
    }
    
    @IBAction func buttonSaveClicked() {
        let context = getContext()
        let entity = getEntity(context)
        
        var newUser = Users(entity: entity, insertIntoManagedObjectContext: context)
        newUser.password = textPassword.text
        newUser.username = textUsername.text
        
        context.save(nil)
        
        println(newUser)
        println("Object saved")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
