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
        "Ван Гог - Звездная Ночь",
        "Ван Гог - Подсолнухи",
        "ДаВинчи - Тайная Вечеря",
        "Казимир Малевич - Черный Квадрат",
        "Рафаэль - Донна Велата",
        "Рафаэль - Сикстинская Мадонна",
        "Сальвадор Дали - Постоянство Памяти",
        "Сандро Ботичелли - Афродита",
        "Шишкин - Утро в сосновом бору",
        "Ян Вермеер - Девушка с жемчужной сережкой"
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
        
        let imageName = imageNameArray[indexPath.item]
        let pictureImage = UIImage(named: imageName)
        cell.favouritePicturesImageView.image = pictureImage

        // 02092021
        let titleImage = imageNameArray[indexPath.row]
        cell.favouritePicturesImageView.image = UIImage(named: titleImage)
        // 02092021
        
        
        // -- еще одна поытка вывести название картинки
        //let imageTitle = imageNameArray[indexPath.item]
        //let titleSection = UIImage(named: imageTitle)

    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPicture" {
            
            // старт --- вывод картинки на втором екране
            let showPictureVC = segue.destination as! ShowPictureVC
            let cell = sender as! FavouritePicturesCell
            showPictureVC.imageSave = cell.favouritePicturesImageView.image
            // конец --- вывод картинки на втором екране
            
            
            //showPictureVC.pictureTitle = cell.favouritePicturesImageView.image?.description  --еще одна попытка вывести название
            
            //if let indexPath = self.collectionView.indexPathsForSelectedItems {
                
                // ------- не понимаю как взять заголовок с картинки и вывести его на втором скрине в качестве названия картины --------
                
                //let imageTitle = showPictureVC.pictureTitle
                //showPictureVC.pictureTitle = imageTitle
                
                //let imageTitle = imageNameArray[indexPath.count - 1]
                // let imageTitle = imageNameArray[indexPath.item]
                //showPictureVC.pictureTitle = imageTitle
                
                //showPictureVC.titleLabelShowPictureVC = imageNameArray[indexPath.item]
            //}
            
        }
    }
    
    // 02092021 -- сейчас в даннный момент выводит заголовок текущей выбранной картины в консоль Xcode.Выводит не рандомное название а именно выбранной картины. НО в консоли.
    override public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       let imageNameSelected = imageNameArray[indexPath.row]
        
       print(imageNameSelected)
    }
    // 02092021
    
    
    //--- Нужно все-таки сделать так чтобы оно наконец-то вывело заголовок на втором екране под текущей выбранной картинкой и имено от той картинки которая выбрана на екране (не рандомное название); -----//
}
