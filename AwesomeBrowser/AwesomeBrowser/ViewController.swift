//
//  ViewController.swift
//  AwesomeBrowser
//
//  Created by Viktoriia Jane Ro on 10.09.2021.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }


}

