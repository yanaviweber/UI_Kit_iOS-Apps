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
    
    var imageSave: UIImage?
    
    var pictureTitle: String?
    
    //var pictureTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewShowPictureVC.image = imageSave
        
        titleLabelShowPictureVC.text = pictureTitle
        titleLabelShowPictureVC.numberOfLines = 0
        
    }

}
