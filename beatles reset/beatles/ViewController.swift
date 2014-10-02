//
//  ViewController.swift
//  beatles
//
//  Created by Aileen Pierce on 9/7/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalizedSwitch: UISwitch!
    @IBOutlet weak var fontSizeNumberLabel: UILabel!
    
    func refreshUI(){
        titleLabel.text="The Beatles"
        imageControl.selectedSegmentIndex = -1
        capitalizedSwitch.on = false
        beatlesImage.image=UIImage(named: "beatles_abbey_road.png")
    }

    @IBAction func changeImage(sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value;
        fontSizeNumberLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
    }
    
    func updateImage() {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Young Beatles"
            beatlesImage.image=UIImage(named: "beatles1.png")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="Not so young Beatles"
            beatlesImage.image=UIImage(named: "beatles2.png")
        }
    }
    
    func updateCaps() {
        if capitalizedSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString //xcode 6.0.1 required ? for .text
        } else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageControl.selectedSegmentIndex = -1
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

