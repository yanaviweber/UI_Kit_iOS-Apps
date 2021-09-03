//
//  BookDetailViewController.swift
//  BooksLister
//
//  Created by Viktoriia Jane Ro on 26.08.2021.
//

import UIKit

class BookDetailViewController: UITableViewController {
    let imageNameArray = [
        "Aditya Bhargava - Rattling Algorithms.jpg",
        "Alexander Shvets - Design Patterns.jpg",
        "Vasily Usov - iOS app development based on the UI Kit framework.jpg",
        "Vasily Usov - Application Development for iOS, iPod, macOS.jpg",
        "Vladston Ferreira Philo - Theoretical Minimum in Computer Science.jpg",
        "McConnel S - The Perfect Code.jpg",
        "Perry G - Miller D - Programming in C.jpg",
        "Svyatoslav Kulikov - Software Testing.jpg",
        "Tim Roughgarden - The Perfect Algorithm - The Basics.jpg",
        "Swiftbook - Swift5_5.jpg"
    ]

       override func viewDidLoad() {
           super.viewDidLoad()

        
       }

       // MARK: - Table view data source

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return imageNameArray.count
       }

       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)

           cell.imageView?.image = UIImage(named: imageNameArray[indexPath.item])
           cell.textLabel?.text = imageNameArray[indexPath.row]
           cell.textLabel?.numberOfLines = 0
           
           
           return cell
       }
       

       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60
       }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = parent as? ViewController {
            let bookTitle = imageNameArray[indexPath.row]
            viewController.titleLabel.text = bookTitle
            viewController.titleLabel.numberOfLines = 0
            
            
            viewController.imageOfTheBook.image = UIImage(named: bookTitle)
        }
    }
    
}
