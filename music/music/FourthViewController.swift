//
//  FourthViewController.swift
//  music
//
//  Created by Aileen Pierce on 10/10/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var artistPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    let artistComponent = 0
    let albumComponent = 1
    
    var artistAlbums = NSDictionary()
    var artists = [String]()
    var albums = [String]()
    
    override func viewDidLoad() {
        //use a NSBundle object of the directory for our application to retrieve the pathname of artistalbums.plist
        let path = NSBundle.mainBundle().pathForResource("artistalbums", ofType: "plist")
        //loads the contents of the plist file into the artistAlbums NSDictionary
        artistAlbums = NSDictionary(contentsOfFile:path!)
        //creates a String Array of all the artists which the NSDictionary has stored as the keys
        artists = artistAlbums.allKeys as [String]
        //get the artist at index 0
        let selectedArtist = artists[0]
        //creates a String Array of all the albums for the selected artist
        albums = artistAlbums.objectForKey(selectedArtist) as [String]
        super.viewDidLoad()
    }
    
    //Methods to implement the picker
    //Required for the UIPickerViewDataSource protocol
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2 //number of components
    }
    
    //Required for the UIPickerViewDataSource protocol
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //checks which component was picked and returns that components row count
        if component==artistComponent {
            return artists.count
        }
        else {
            return albums.count
        }
    }
    
    //Picker Delegate methods
    //Returns the title for a given row
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        //checks which component was picked and returns the value for the requested component
        if component==artistComponent {
            return artists[row]
        }
        else {
            return albums[row]
        }
    }
    
    //Called when a row is selected
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //checks which component was picked
        if component==artistComponent {
            let selectedArtist = artists[row] //gets the selected artist
            albums = artistAlbums.objectForKey(selectedArtist) as [String] //gets the albums for the selected artist
            artistPicker.selectRow(0, inComponent: albumComponent, animated: true) //set the right component back to 0
            artistPicker.reloadComponent(albumComponent) //reload the right component
        }
        let artistrow = artistPicker.selectedRowInComponent(0) //gets the choosen row for the artist
        let albumrow = artistPicker.selectedRowInComponent(1) //gets the choosen row for the album
        choiceLabel.text="You like \(albums[albumrow]) by \(artists[artistrow])" //writes the string with the selected row's content to the label
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
