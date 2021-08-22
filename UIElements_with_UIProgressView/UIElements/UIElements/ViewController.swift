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
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        textView.isHidden = true
        textView.alpha = 0
        
        textView.text = "Enter your text"
        textView.textColor = .black
        
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = .init(genericCMYKCyan: 100, magenta: 100, yellow: 100, black: 100, alpha: 99)
        textView.layer.borderWidth = 1
        textView.textContainer.lineFragmentPadding = 20
        
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        stepper.tintColor = .white
        stepper.backgroundColor  = .systemGreen
        stepper.layer.cornerRadius = 5

        
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        activityIndicator.startAnimating()
        
        //UIApplication.shared.beginIgnoringInteractionEvents() - it isn't support by Apple
        // This method supported by Apple instead the method beginIgnoringInteractionEvents()
        self.view.isUserInteractionEnabled = false
        
        
        // method which contains observers controlling the display of the keyboard
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateTextView(notification: )),
                    name: UIResponder.keyboardWillChangeFrameNotification,
                    object: nil)
        
        // method which contains observers controlling the hiding of the keyboard
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateTextView(notification: )),
                    name: UIResponder.keyboardWillHideNotification,
                    object: nil)
        
        
        // method which controls duration of animation for the UIActivityIndicator
        UIView.animate(withDuration: 0, delay: 5, options: .curveEaseIn, animations: {
            self.textView.alpha = 1
        }) { (finished) in
            self.activityIndicator.stopAnimating()
            self.textView.isHidden = false
            self.view.isUserInteractionEnabled = true
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // Hiding the keyboard called for any object
        
        // textView.resignFirstResponder()  // Hiding the keyboard called for a specific object
        
    }

    @objc func updateTextView(notification: Notification) {
        guard
            let userInfo = notification.userInfo as? [String: AnyObject],
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
    
    
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
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
