//
//  ViewController.swift
//  task
//
//  Created by Aileen Pierce on 11/17/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let kFilename = "archive2"
    var dataFilePath=DataManager()
    var taskArchive = Task()

    @IBOutlet weak var task1: UITextField!
    @IBOutlet weak var task2: UITextField!
    @IBOutlet weak var task3: UITextField!
    @IBOutlet weak var task4: UITextField!
    
    override func viewDidLoad() {
        task1.delegate=self
        task2.delegate=self
        task3.delegate=self
        task4.delegate=self
        let filepath = dataFilePath.docFilePath(kFilename)
        let fileManager = NSFileManager.defaultManager()
        //check to see if the file exists
        if fileManager.fileExistsAtPath(filepath!) {
            //create an instance from the archive file
            let data = NSData(contentsOfFile: filepath!)
            //let data: NSMutableData = NSMutableData(base64Encoding: filepath)
            //create an instance to decode the data
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            //read the objects from the unarchiver
            taskArchive = unarchiver.decodeObjectForKey("Data") as Task
            unarchiver.finishDecoding()
            //copy values into the text fields
            task1.text=taskArchive.tasks[0] as String
            task2.text=taskArchive.tasks[1] as String
            task3.text=taskArchive.tasks[2] as String
            task4.text=taskArchive.tasks[3] as String
        }
        let app = UIApplication.sharedApplication() //application instance
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: "UIApplicationWillResignActiveNotification", object: app)
        super.viewDidLoad()
    }
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(notification: NSNotification){
        let filepath = dataFilePath.docFilePath(kFilename)
        taskArchive.tasks[0]=task1.text
        taskArchive.tasks[1]=task2.text
        taskArchive.tasks[2]=task3.text
        taskArchive.tasks[3]=task4.text
        //create an instance to hold the encoded data
        var data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        //archive objects
        archiver.encodeObject(taskArchive, forKey: "Data")
        //tell the archiver we're finished encoding
        archiver.finishEncoding()
        //write the contents of the array to our plist file
        data.writeToFile(filepath!, atomically: true)
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

