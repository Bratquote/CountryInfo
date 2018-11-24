//
//  JSONHandlerProtocol.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation

protocol JSONHandlerProtocol {
    var startJSONUrl: String {get}
    
    
    func getJSON(urlString: URL)
    func saveJSON()
    
    
}
