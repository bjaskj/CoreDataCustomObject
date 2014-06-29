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
    }
    
    @IBAction func buttonSaveClicked() {
        /*
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: entity, insertIntoManagedObjectContext: context)
        newUser.password = textPassword.text!
        newUser.username = textUsername.text!
        */
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = getContext()
        let entity = getEntity(context)
        
        var newUser = Users(entity: entity, insertIntoManagedObjectContext: context)
        newUser.password = textPassword.text!
        newUser.username = textUsername.text!
        
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
