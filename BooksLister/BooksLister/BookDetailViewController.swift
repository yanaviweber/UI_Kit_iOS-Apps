//
//  BookDetailViewController.swift
//  BooksLister
//
//  Created by Viktoriia Jane Ro on 26.08.2021.
//

import UIKit

class BookDetailViewController: UITableViewController {
    let imageNameArray = [
        "Адитья Бхаргава - Грокаем алгоритмы.jpg",
        "Александр Швец - Паттерны Проектирования.jpg",
        "Василий Усов - Разработка приложений под iOS на основе фреймворка UI Kit.jpg",
        "Василий Усов - Разработка приложений под iOS, iPod, macOS.jpg",
        "Владстон Феррейра Фило - Теоритический минимум по  компьютерным наукам.jpg",
        "Макконел С - Совершенный код.jpg",
        "Перри Г - Миллер Д - Программирование на С.jpg",
        "Святослав Куликов - Тестирование программного обеспечения.jpg",
        "Тим Рафгарден - Совершенный Алгоритм - Основы.jpg",
        "Swiftbook - Swift5-5.jpg"
    ]

       override func viewDidLoad() {
           super.viewDidLoad()

           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false

           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
       }

       // MARK: - Table view data source

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return imageNameArray.count
       }

       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)

           cell.imageView?.image = UIImage(named: imageNameArray[indexPath.item])
           //cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
           cell.textLabel?.text = imageNameArray[indexPath.row]
           cell.textLabel?.numberOfLines = 0
           
           
           return cell
       }
       

       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60
       }
    
    
    
}
