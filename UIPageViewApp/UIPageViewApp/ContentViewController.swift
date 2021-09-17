//
//  ContentViewController.swift
//  UIPageViewApp
//
//  Created by Viktoriia Jane Ro on 11.09.2021.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var closePresentationButton: UIButton!
    
    //let tapPresentation = UIPageViewController()
    
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0 // number of the current page
    var numberOfPages = 0 // total number of pages
    
    var presentationButtonIsHidden = true // -- button variable
  
    var closePresButton: UIButton? // variable for set button on the global visibility level
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closePresentationButton.isHidden = presentationButtonIsHidden // -- save value for the button
                
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        
        closePresentationButton = closePresButton
        
    }

    @IBAction func closePresentationAction(_ sender: UIButton) {
        
        // -- close presentation
          let userDefaults = UserDefaults.standard
          userDefaults.set(true, forKey: "presentationWasViewed")
          
          dismiss(animated: true, completion: nil)
        
    }

}

