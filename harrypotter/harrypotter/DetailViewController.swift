//
//  DetailViewController.swift
//  harrypotter
//
//  Created by Aileen Pierce on 10/27/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                self.loadWebPage(detail.description)
            }
       }
    }

    func loadWebPage(urlString: String){
        //the string passed should be a properly formed url
        //creates a NSURL object with the string passed in
        let url:NSURL = NSURL(string:urlString)!
        //creates a NSURLRequest object
        let request:NSURLRequest = NSURLRequest(URL: url)
        //loads the NSURLRequest object in our web view
        webView.loadRequest(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

