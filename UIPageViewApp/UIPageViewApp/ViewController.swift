//
//  ViewController.swift
//  UIPageViewApp
//
//  Created by Viktoriia Jane Ro on 11.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //this method allows to call the method startPresentation
    override func viewDidAppear(_ animated: Bool) {
        /*
         the viewDidAppear method is triggered immediately after the application is loaded, after the View is displayed on the screen
         */
        super.viewDidAppear(animated)
        
        startPresentation()
        
    }
    
    
    // method which runs PageViewController
    func startPresentation(){
        
        // extend realization for special key when presentation is closed
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(identifier: "PageViewController") as? PageViewController {
                
                // if we could show ViewController, - we need show View Controller
                present(pageViewController, animated: true, completion: nil)
            }
        }
    }

}

