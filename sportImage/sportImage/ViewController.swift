//
//  ViewController.swift
//  sportImage
//
//  Created by Aileen Pierce on 9/8/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!

    @IBAction func chooseTeam(sender: UIButton) {
        if sender.tag==1 {
            sportImage.image=UIImage(named: "rockies.png")
            messageLabel.text="I'm a Rockies fan too " + "\(nameField.text)"
        }
        if sender.tag==2 {
            sportImage.image=UIImage(named: "broncos.png")
            messageLabel.text="Get ready for Broncos season " + "\(nameField.text)"
        }
    }
    
    @IBAction func textFieldDoneEditing(sender: AnyObject) {
        nameField.resignFirstResponder()
    } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

