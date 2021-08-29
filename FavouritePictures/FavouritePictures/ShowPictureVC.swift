//
//  ShowPictureVC.swift
//  FavouritePictures
//
//  Created by Viktoriia Jane Ro on 29.08.2021.
//

import UIKit

class ShowPictureVC: UIViewController {

    
    @IBOutlet weak var imageViewShowPictureVC: UIImageView!
    
    @IBOutlet weak var titleLabelShowPictureVC: UILabel!
    //@IBOutlet weak var image: UIImageView!
    //IBOutlet weak var titleLabel: UILabel!
    
    var imageSave: UIImage?
    
    var pictureTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewShowPictureVC.image = imageSave
        
        //image.image = imageSave
        
        //image.image = UIImage(named: pictureTitle)
        //titleLabel.text = pictureTitle
        //titleLabel.numberOfLines = 0
        
    }

}
