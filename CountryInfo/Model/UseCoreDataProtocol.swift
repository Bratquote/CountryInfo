//
//  UseCoreDataProtocol.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


protocol UseCoreDataProtocol {
    
    func saveToCoreData(country: CountryJSON)
    
    func getFromCoreDataCountry(countryName: String) -> CountryJSON
}
