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
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func backButtonAction(_ sender: Any) {
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
    }
    
    
}

