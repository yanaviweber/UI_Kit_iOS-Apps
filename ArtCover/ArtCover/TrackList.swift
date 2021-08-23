//
//  TrackList.swift
//  ArtCover
//
//  Created by Viktoriia Jane Ro on 23.08.2021.
//

import UIKit

class TrackList: UITableViewController {
    
    let imageNameArray = [
        "Michael Jackson - Price of Frame",
        "Michael Jackson - Dirty Diana (2012 Remaster)",
        "Michael Jackson - Billie Jean",
        "Billy Ocean - When the Going Gets Tough, The Tough Get Going",
        "Michael Jackson - Remember the Time",
        "Madonna - Into the Groove",
        "The Jacksons 5 - I’ll Be There",
        "Whithey Houston - I Will Always Love You",
        "Whithey Houston - I Wanna Dance With Somebody",
        "Jenifer Lopez - On The Floor(ft. Pitbull)"
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailVC
                detailVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
         
    }
    

}
