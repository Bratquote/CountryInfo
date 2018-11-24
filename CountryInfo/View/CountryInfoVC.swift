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
    
    var currentCountry: CountryJSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPage()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpPage() {
        if let info = currentCountry {
        countryName.text = info.name
        capital.text = info.capital
        population.text = String(info.population)
        continent.text = info.continent
        information.text = info.description
        }
    }

   

}
