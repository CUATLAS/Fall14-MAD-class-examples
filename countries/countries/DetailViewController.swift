//
//  DetailViewController.swift
//  countries
//
//  Created by Aileen Pierce on 10/20/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate  {

    var countries = [String]()
    var continentCountries = Continents()
    var selectedContinent = 0
    
    override func viewWillAppear(animated: Bool) {
        continentCountries.continents = continentCountries.continentData.allKeys as [String]
        let chosenContinent = continentCountries.continents[selectedContinent]
        countries = continentCountries.continentData.objectForKey(chosenContinent) as [String]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return countries.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        //sets the text of the cell with the row being requested
        cell.textLabel?.text=countries[indexPath.row]
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            countries.removeAtIndex(indexPath.row)
            let chosenContinent = continentCountries.continents[selectedContinent]
            //deletes from the data model
            continentCountries.continentData[chosenContinent]?.removeObjectAtIndex(indexPath.row)
            //delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let fromRow=fromIndexPath.row
        let toRow=toIndexPath.row
        let moveCountry=countries[fromRow]
        countries.removeAtIndex(fromRow)
        countries.insert(moveCountry, atIndex: toRow)
        //move in data model
        let chosenContinent = continentCountries.continents[selectedContinent]
        continentCountries.continentData[chosenContinent]?.removeObjectAtIndex(fromRow)
        continentCountries.continentData[chosenContinent]?.insertObject(moveCountry, atIndex: toRow)
    }
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
