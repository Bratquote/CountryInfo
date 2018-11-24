//
//  JSONData.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


struct JSONData: Codable {
    var next: String?
    var countries: [CountryJSON]
}
