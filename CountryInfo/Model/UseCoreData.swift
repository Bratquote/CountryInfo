//
//  useCoreData.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class UseCoreData {
    
    let appDelegate: AppDelegate
    let context: NSManagedObjectContext!
    let countryEntity: NSEntityDescription?
    let imageEntity: NSEntityDescription?
    //= NSEntityDescription.entity(forEntityName: "Users", in: context)
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        self.countryEntity = NSEntityDescription.entity(forEntityName: "Country", in: context)
        self.imageEntity = NSEntityDescription.entity(forEntityName: "Image", in: context)
    }
    
    func addCountry(country: CountryJSON) {
       let newCountry = NSManagedObject(entity: countryEntity!, insertInto: context)
         
    }
    
    func addImage(url: String, data: Data) {
        
    }
    
    
    
    
    
    
    
    
}
