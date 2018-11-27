//
//  TestViewController.swift
//  CountryInfo
//
//  Created by Timur Karimov on 27/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class CountryInfoVC2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var images = [UIImage(named: "AustraliaFlag"),UIImage(named: "BritainFlag"),UIImage(named: "AbhkaziaFlag")]
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var continent: UILabel!
    @IBOutlet weak var information: UILabel!
    
    var currentCountry: CountryJSON!
    var imageHandler = ImageHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setUpPageLabels()
        
    }
    

    
    func setUpPageLabels() {
        
        countryName.text = currentCountry.name
        capital.text = currentCountry.capital
        population.text = String(currentCountry.population!)
        continent.text = currentCountry.continent
        information.text = currentCountry.description
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionCell
        cell.image.image = images[indexPath.row]
        cell.sizeToFit()
        cell.frame.size.width = UIScreen.main.bounds.width
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    

}
