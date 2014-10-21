//
//  ViewController.swift
//  scrabbleQ
//
//  Created by Aileen Pierce on 10/15/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var words = [String]()
    
    override func viewDidLoad() {
        //use a NSBundle object of the directory for our application to retrieve the pathname of qwordswithoutu1.plist
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu1", ofType: "plist")
        //load the words of the plist file into the array
        words = NSArray(contentsOfFile: path!) as Array
        super.viewDidLoad()
    }

    //Required methods for UITableViewDataSource
    
    // Customize the number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        //set the text of the cell
        cell.textLabel?.text=words[indexPath.row]
        cell.detailTextLabel?.text="Q no U"
        cell.imageView?.image=UIImage(named: "scrabbletile90.png")
        return cell
    }
    
    //UITableViewDelegate method that is called when a row is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "Row selected", message: "You selected \(words[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        let okaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
        alert.addAction(okaction)
        self.presentViewController(alert, animated: true, completion: nil)
        //deselects the row that had been choosen
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

