//
//  PreviewPage.swift
//  FavouritePictures
//
//  Created by Viktoriia Jane Ro on 29.08.2021.
//

import UIKit

private let reuseIdentifier = "FavouritePictures"

class PreviewPage: UICollectionViewController {

    var imageNameArray = [
        "Van Gogh - Starry Night",
        "Van Gogh - Sunflowers",
        "DaVinci - The Last Supper",
        "Kazimir Malevich - Black Square",
        "Rafael - Donna Velata",
        "Raphael - Sistine Madonna",
        "Salvador Dali - The Permanence of Memory",
        "Sandro Botticelli - Aphrodite",
        "Shishkin - Morning in a Pine Forest",
        "Jan Vermeer - The Girl with the Pearl Earring"
    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavouritePicturesCell
        
        cell.favouritePicturesImageView.image = UIImage(named: imageNameArray[indexPath.row])
        let imageName = imageNameArray[indexPath.row]
        
        //let pictureImage = UIImage(named: imageName)
        //cell.favouritePicturesImageView.image = pictureImage

        // 02092021
        let titleImage = imageNameArray[indexPath.row]
        cell.favouritePicturesImageView.image = UIImage(named: titleImage)
        // 02092021
        
        // 03092021
        cell.pictureTitle = imageName
        // 03092021

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPicture" {
            
            // старт --- вывод картинки с превью первого екрана на втором екране
            let showPictureVC = segue.destination as! ShowPictureVC
            let cell = sender as! FavouritePicturesCell
            showPictureVC.imageSave = cell.favouritePicturesImageView.image
            // конец
            
            //03092021 --- старт --- вывод текста в UILabel на второй экран
            showPictureVC.pictureTitle = cell.pictureTitle
            //03092021 --- конец
            
        }
    }
    
    // 02092021 -- дополнительно выводит заголовок текущей выбранной картины в консоль Xcode.Выводит не рандомное название а именно выбранной картины.
    override public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       let imageNameSelected = imageNameArray[indexPath.row]
        
       print(imageNameSelected)
    }
    // 02092021
    
}
