//
//  Task.swift
//  task
//
//  Created by Aileen Pierce on 11/17/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import Foundation

class Task : NSObject, NSCoding {
    var tasks = NSMutableArray()

    override init() {
        super.init()
    }
    
    //NSCoder method to encode objects into an archive
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(tasks[0], forKey: "Task1")
        aCoder.encodeObject(tasks[1], forKey: "Task2")
        aCoder.encodeObject(tasks[2], forKey: "Task3")
        aCoder.encodeObject(tasks[3], forKey: "Task4")
    }
    
    //NSCoder method to decode objects from an archive
    required init(coder aDecoder: NSCoder) {
        super.init()
        tasks[0] = aDecoder.decodeObjectForKey("Task1") as String
        tasks[1] = aDecoder.decodeObjectForKey("Task2") as String
        tasks[2] = aDecoder.decodeObjectForKey("Task3") as String
        tasks[3] = aDecoder.decodeObjectForKey("Task4") as String
    }
    
}
