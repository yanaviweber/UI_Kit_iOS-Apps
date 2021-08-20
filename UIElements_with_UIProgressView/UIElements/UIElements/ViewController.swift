//
//  ViewController.swift
//  UIElements
//
//  Created by Viktoriia Jane Ro on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // Hiding the keyboard called for any object
        
        // textView.resignFirstResponder()  // Hiding the keyboard called for a specific object
        
    }


}

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
}
