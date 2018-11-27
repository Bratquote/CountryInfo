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
    let imageUrlEntity: NSEntityDescription?
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        self.countryEntity = NSEntityDescription.entity(forEntityName: "Country", in: context)
        self.imageEntity = NSEntityDescription.entity(forEntityName: "Image", in: context)
        self.imageUrlEntity = NSEntityDescription.entity(forEntityName: "ImageUrl", in: context)
        
    }
    
    func addCountry(countryArray: [CountryJSON]) {
        
        for country in countryArray {
            
            let newCountry = NSManagedObject(entity: countryEntity!, insertInto: context)
            newCountry.setValue(Int32(country.population!), forKey: "population")
            newCountry.setValue(country.capital, forKey: "capital")
            newCountry.setValue(country.continent, forKey: "continent")
            newCountry.setValue(country.description_small, forKey: "description_small")
            newCountry.setValue(country.description, forKey: "description_large")
            newCountry.setValue(country.country_info!.flag, forKey: "flag")
            newCountry.setValue(country.image, forKey: "image")
            newCountry.setValue(country.name, forKey: "name")
            
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
            
        }
    }
    
    
    func addToImageUrl(country: CountryJSON, url: String) {
        
        for i in (country.country_info?.images)! {
            let imageUrl = NSManagedObject(entity: imageUrlEntity!, insertInto: context)
            imageUrl.setValue(i, forKey: "url")
            imageUrl.setValue(country.name, forKey: "countryName")
        }
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
    }
    
    
    func printCountryList() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Country")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "flag") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
    }
    func deleteCountryCoreData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Country")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
                do {
                    try context.save()
                } catch {
                    print("Failed saving")
                }
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    func countryCoreDataCount() -> Int {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Country")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            print("Result count: \(result.count)")
            return result.count
        } catch {
            
            print("Failed")
        }
        return 0
        }
    
    
    func getCountries() -> [CountryJSON] {
        var countries = [CountryJSON]()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Country")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                var country = CountryJSON()
                country.capital = data.value(forKey: "capital") as? String
                country.continent = data.value(forKey: "continent") as? String
                country.description = data.value(forKey: "description_large") as? String
                country.description_small = data.value(forKey: "description_small") as? String
                country.image = data.value(forKey: "image") as? String
                country.name = data.value(forKey: "name") as? String
                country.population = data.value(forKey: "population") as? Int
                country.country_info = CountryInfo()
                country.country_info.flag = data.value(forKey: "flag") as? String
    
                countries.append(country)
                
                
            }
        } catch {
            print("Error: \(error)")
        }
        
        return countries
    }
    
    
  
        
    
    
    
    func addImage(url: String, data: Data) {
        
        if let dataFromCoreData = getImageFromCoreData(url: url) {
            if dataFromCoreData != data {
                let newImage = NSManagedObject(entity: imageEntity!, insertInto: context)
                newImage.setValue(data, forKey: "image")
                newImage.setValue(url, forKey: "url")
            }
        } else {
            let newImage = NSManagedObject(entity: imageEntity!, insertInto: context)
            newImage.setValue(data, forKey: "image")
            newImage.setValue(url, forKey: "url")
        }
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
        
        
    }
    
    
    func getImageFromCoreData(url: String) -> Data? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                if data.value(forKey: "url") as? String == url {
                    return data.value(forKey: "image") as? Data
                }
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    

}
