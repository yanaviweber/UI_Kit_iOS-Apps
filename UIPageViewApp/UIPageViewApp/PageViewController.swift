//
//  PageViewController.swift
//  UIPageViewApp
//
//  Created by Viktoriia Jane Ro on 11.09.2021.
//

import UIKit

class PageViewController: UIPageViewController {

    let presentScreenContent = [
    "Первая страница презентации, - рассказывает о сути приложения",
    "Вторая страница презентации, - рассказывает о какой-то фишке приложения",
    "Третья страница презентации, - показывает еще что-то очен интересное в виде картинки и анимации",
    "Последяя страница презентации, - какое-то приятное пожелание пользователю", ""
    
    ]
    
    let emojiArray = [
    "😉","👩‍💻","😎","😍", ""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // we need to assign the class as a delegate of the protocol datasource
        dataSource = self

        //declare method ContentViewController
        if let contentViewController = showViewControllerAtIndex(0){
            
            //method which create array of the View Controllers
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
                    
        }
        
        closePresentationButtonFunc()
    }
    
  
    //method which allows for us to create ViewController
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else { return nil }
        guard let contentViewController = storyboard?.instantiateViewController(identifier: "ContentViewController")
                as? ContentViewController else { return nil }
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        //contentViewController.buttonForClose = closePresentationButtonFunc
        
        // пока оно выводит просто свайпом закрытие презентации
        if contentViewController.currentPage == presentScreenContent.count-1{
            closePresentationButtonFunc()
            
        }
       
        return contentViewController
    }
    
    //функция которая работает с параметрами закрытия презентации
    func closePresentationButtonFunc(){
           
            //-------------
            //сreating a key that allows you to save the state of the presentation before it closes
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasViewed")
            
        
            //method which close controller
            dismiss(animated: true, completion: nil)
            //------------
    }
    
}



extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // get number of current page
        var pageNumber = (viewController as! ContentViewController).currentPage
        
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // get number of current page
        var pageNumber = (viewController as! ContentViewController).currentPage
        
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
        
    }
    
}
