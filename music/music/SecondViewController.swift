//
//  SecondViewController.swift
//  music
//
//  Created by Aileen Pierce on 10/6/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var musicWebView: UIWebView!
    @IBOutlet weak var musicSpinner: UIActivityIndicatorView!
    
    func loadWebPage(urlString: String){
        //the string passed should be a properly formed url
        let url = NSURL.URLWithString(urlString) //creates a NSURL object with the string passed in
        let request = NSURLRequest(URL: url) //creates a NSURLRequest object
        musicWebView.loadRequest(request) //loads the NSURLRequest object in our web view
    }
    
    override func viewDidLoad() {
        musicWebView.delegate=self
        loadWebPage("https://www.apple.com/itunes")
        super.viewDidLoad()
    }

    //UIWebViewDelegate method that is called when a web page begins to load
    func webViewDidStartLoad(webView: UIWebView) {
        musicSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads successfully
    func webViewDidFinishLoad(webView: UIWebView) {
        musicSpinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

