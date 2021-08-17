//
//  ViewController.swift
//  UIButtonAndLabel
//
//  Created by Viktoriia Jane Ro on 17.08.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textColor = UIColor.red
        
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        
        label.text = "Hello, World!"
    }
    
}

