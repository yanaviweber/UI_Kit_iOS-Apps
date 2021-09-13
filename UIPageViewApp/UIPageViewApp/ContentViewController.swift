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
    
  
    var closePresButton: UIButton? // переменная для вывода кнопки на глобальный уровень
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //кнопка изначально скрыта (пока не дойдет до последнего скрина)
        closePresentationButton.isHidden = true
        
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        
        closePresentationButton = closePresButton
        
        //еще раз попытка показать скрытую кнопку именно на последнем скрине
        //closePresentationButton.isHidden = false
        

    }
    
    //тут кнопка которая должна появится при просмотре последнего скрина

    @IBAction func closePresentationAction(_ sender: UIButton) {
        
        let closePresentation = PageViewController()
        closePresentation.closePresentationButtonFunc()
        
    }

}

