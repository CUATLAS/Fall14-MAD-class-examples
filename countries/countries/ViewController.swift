//
//  ViewController.swift
//  countries
//
//  Created by Aileen Pierce on 10/20/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    var continentList=Continents()
    
    override func viewDidLoad() {
        //use a NSBundle object of the directory for our application to retrieve the pathname of qwordswithoutu1.plist
        let path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        //load the words of the plist file into the array
        continentList.continentData = NSMutableDictionary(contentsOfFile: path!)
        // gets all keys which are the continents
        continentList.continents = continentList.continentData.allKeys as [String]
        super.viewDidLoad()
    }
    
    //Required methods for UITableViewDataSource
    
    // Customize the number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentList.continentData.count
    }
    
    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        //set the text of the cell
        cell.textLabel?.text=continentList.continents[indexPath.row]
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="countrysegue"{
            var countryVC=segue.destinationViewController as DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow()!
            //sets the data for the destination controller
            countryVC.title=continentList.continents[indexPath.row]
            countryVC.continentCountries=continentList
            countryVC.selectedContinent=indexPath.row
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

