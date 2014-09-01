//
//  ViewController.swift
//  helloworld
//
//  Created by Aileen Pierce on 8/27/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var messageText: UILabel!
    @IBAction func buttonPressed(sender: UIButton) {
        messageText.text="Hello World!"
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

