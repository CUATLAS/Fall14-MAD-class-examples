//
//  DataManager.swift
//  task
//
//  Created by Aileen Pierce on 11/17/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import Foundation

class DataManager {
    var path = []
    
    func docFilePath(filename: String)->String? {
        //locates the document directory
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) //returns an array
        let dir = paths[0] as String//document directory
        //creates the full path to our data file
        return dir.stringByAppendingPathComponent(filename)
    }
}