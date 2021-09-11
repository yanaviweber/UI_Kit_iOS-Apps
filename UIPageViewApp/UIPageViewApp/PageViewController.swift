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
    "Последяя страница презентации, - напутствие на добрый путь с каким-то приятным пожеланием пользователю"
    
    ]
    
    let emojiArray = [
    "😉","👩‍💻","😎","😍"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare method ContentViewController
        if let contentViewController = showViewControllerAtIndex(0){
            
            //method which create array of the View Controllers
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }

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
        
        return contentViewController
    }

}
