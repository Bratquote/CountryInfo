//
//  JSONHandler.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


class JSONHandler {
    var countriesList = [CountryJSON]()
    var useCoreData = UseCoreData()
    
    var startJSONUrl: String = "https://rawgit.com/NikitaAsabin/799e4502c9fc3e0ea7af439b2dfd88fa/raw/7f5c6c66358501f72fada21e04d75f64474a7888/page1.json"
    var nextJSONUrl: String?
    
    func getData(urlString: String) {
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(data: data)
            }
        }
    }
    
    func parse(data: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCountries = try? decoder.decode(JSONData.self, from: data) {
            countriesList = jsonCountries.countries
        
            //useCoreData.addCountry(countryArray: countriesList)
            
            nextJSONUrl = jsonCountries.next
        }
    }
}
