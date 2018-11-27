//
//  CountryInfo.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class CountryInfoVC: UIViewController{

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
        setUpPageLabels()
        setUpPageImages()
        setUpNavigationBar()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: nil)
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setUpPageLabels() {
        
        countryName.text = currentCountry.name
        capital.text = currentCountry.capital
        population.text = String(currentCountry.population!)
        continent.text = currentCountry.continent
        information.text = currentCountry.description
        
    }
    
    
    func setUpPageImages() {
        
        if ReachabilityTest.isConnectedToNetwork() {
            //If we connected to network first we try to find image in imageDictionary, else get from json
            if let data = JSONHandler.imageDictionary[currentCountry.image!] {
                image.image = UIImage(data: data)
            }  else if currentCountry.image != "" {
                imageHandler.getImage2(urlString: currentCountry.image!, imageView: image)
            } else if let data = JSONHandler.imageDictionary[currentCountry.country_info.flag!] {
                image.image = UIImage(data: data)
            } else {
                imageHandler.getImage2(urlString: currentCountry.country_info!.flag!, imageView: image)
            }
        } else {
        // if connection lost we get image from CoreData
            let useCoreData = UseCoreData()
            if currentCountry.image != "" {
                if let data = useCoreData.getImageFromCoreData(url: currentCountry.image!) {
                    image.image = UIImage(data: data)
                }
            } else if let data = useCoreData.getImageFromCoreData(url: currentCountry.country_info.flag!){
                image.image = UIImage(data: data)
            }
        }
    }
}
