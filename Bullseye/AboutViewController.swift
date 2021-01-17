//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Melanie Kramer on 1/15/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    // outlet to connect to the WKWebView on AboutViewController
    @IBOutlet weak var webView: WKWebView!
    
    // action function to close the view
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    // load the view
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // assign Bullseye.html to variable url
        if let url = Bundle.main.url(forResource: "Bullseye",
                                        withExtension: "html") {
            let request = URLRequest(url: url)
            // load the page to the WKWebView on AboutViewController
            webView.load(request)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


