//
//  ThirdViewController.swift
//  music
//
//  Created by Aileen Pierce on 10/6/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var questionTextview: UITextView!
    @IBAction func submitQuestion(sender: UIButton) {
        //mailto syntax: mailto:first@example.com?cc=second@example.com,third@example.com&subject=something&body=the body
        //mailto parameter should be preceded by “?” for the first or only parameter and “&” for second and subsequent parameter
        //dismisses the keyboard by using resignFirstResponder regardless of which field is the first responder.
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to: nil, from: nil, forEvent: nil)
        var email : String
        email = "mailto:aileen.pierce@colorado.edu?subject=Question from music app&body=\(questionTextview.text) from \(nameTextfield.text) \(emailTextfield.text)"
        email = email.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        UIApplication.sharedApplication().openURL(NSURL.URLWithString(email))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
