//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Viktoriia Jane Ro on 18.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Thir", at: 2, animated: true)
        
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
    }
    
}

