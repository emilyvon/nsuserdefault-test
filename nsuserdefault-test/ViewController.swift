//
//  ViewController.swift
//  nsuserdefault-test
//
//  Created by Mengying Feng on 1/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favLbl: UILabel!
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favLbl.text = "Favourite Color: \(color)"
        } else {
            favLbl.text = "Pick a color: "
        }
        
        //1. Encode people array
        let p1 = Person(first: "Emily", last: "Fung")
        let p2 = Person(first: "Scott", last: "Rolinski")
        let p3 = Person(first: "Kelly", last: "Rolinski")
        
        people.append(p1)
        people.append(p2)
        people.append(p3)
        
        //2. Save people array as data (Archiver)
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func green(sender: AnyObject) {
        favLbl.text = "Favourite Color: Green"
        NSUserDefaults.standardUserDefaults().setValue("Green", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()//save it
    }

    @IBAction func blue(sender: AnyObject) {
        favLbl.text = "Favourite Color: Blue"
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //1. get data from NSUserDafualts
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            
            //2. Unarchive data back to people array
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
    }

    @IBAction func yellow(sender: AnyObject) {
        favLbl.text = "Favourite Color: Yellow"
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}

