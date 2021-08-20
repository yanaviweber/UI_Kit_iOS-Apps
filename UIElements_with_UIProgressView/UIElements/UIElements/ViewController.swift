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
    
    @IBOutlet weak var textViewButtonConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        
        textView.text = ""
        
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        // methods that contain observers controlling the display and hiding of the keyboard
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateTextView(notification: )),
                    name: UIResponder.keyboardWillShowNotification,
                    object: nil)
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateTextView(notification: )),
                    name: UIResponder.keyboardWillHideNotification,
                    object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // Hiding the keyboard called for any object
        
        // textView.resignFirstResponder()  // Hiding the keyboard called for a specific object
        
    }

    @objc func updateTextView(notification: Notification) {
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - textViewButtonConstraint.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        
        return textView.text.count + (text.count - range.length) <= 60
        
    }
}
