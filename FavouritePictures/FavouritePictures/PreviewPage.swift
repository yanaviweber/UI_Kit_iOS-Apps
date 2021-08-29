//
//  PreviewPage.swift
//  FavouritePictures
//
//  Created by Viktoriia Jane Ro on 29.08.2021.
//

import UIKit

private let reuseIdentifier = "FavouritePictures"

class PreviewPage: UICollectionViewController {

    let imageNameArray = [
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
        
        cell.favouritePicturesImageView.image = UIImage(named: imageNameArray[indexPath.row])
        // Configure the cell
    
        return cell
    }

}
