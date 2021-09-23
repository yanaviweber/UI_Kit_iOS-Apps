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
        
        
        //for button "Return" allows data from urlTextField
        urlTextField.delegate = self
        
        //enable for update url-address when page is loading
        webView.navigationDelegate = self
        
        let homePage = "https://www.apple.com"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        
        
        urlTextField.text = homePage
        
        webView.load(request)
        
        //this enable parameter allows you to show navigation in the browser
        webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func backButtonAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
}

extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    
    
    //this method allows you to return data from a text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        
        //for our keyboard is hidden after tap in the "Return" button
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //implementation for update url-address when page is loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlTextField.text = webView.url?.absoluteString
        
        //possibility to enable buttons "Back", "Forward"
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
    
}
