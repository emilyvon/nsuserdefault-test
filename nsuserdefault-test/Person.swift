//
//  Person.swift
//  nsuserdefault-test
//
//  Created by Mengying Feng on 1/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {//if you want to save a custom class to NSUserDefault, you need to implement these classes
    var firstName: String
    var lastName: String
    
    init(first:String, last: String) {
        firstName = first
        lastName = last
    }
    
    override init() {
        firstName = "default_first"
        lastName = "default_last"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {//when loading from NSUserDefault, it automacally decode
        self.init()
        
        self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {//save NSUserDefault to the device
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
}