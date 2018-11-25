//
//  CountryInfo.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class CountryInfoVC: UIViewController {

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
        setUpPage()
        imageHandler.getImage2(urlString: currentCountry.image)
        image.image = imageHandler.downloadedImage
        // Do any additional setup after loading the view.
    }
    
    
    func setUpPage() {
        
        countryName.text = currentCountry.name
        capital.text = currentCountry.capital
        population.text = String(currentCountry.population)
        continent.text = currentCountry.continent
        information.text = currentCountry.description
        
    }
    
    @IBAction func reload(_ sender: Any) {
        
        image.image = imageHandler.downloadedImage
    }
    
   

}
