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
    
    var closePres = ""
    
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0 // number of the current page
    var numberOfPages = 0 // total number of pages
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        closePresentationButton.isHidden = true
        
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage

    }
    
    @IBAction func closePresentationAction(_ sender: Any) {
        
        var closePresentation = UIPageViewController()
       // closePresentation.closePresentationButtonFunc()
    }
    
}
