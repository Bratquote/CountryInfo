//
//  Country.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


struct CountryJSON: Codable {
    
    var name: String?
    var continent: String?
    var capital: String?
    var population: Int?
    var description_small: String?
    var description: String?
    var image: String?
    var country_info: CountryInfo!
    
    
    
    
}



