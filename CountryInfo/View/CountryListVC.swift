//
//  CountryList.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class CountryListVC: UITableViewController {
    let json = JSONHandler()
    let imageHandler2 = ImageHandler()
    var flags: [UIImage]?
    override func viewDidLoad() {
        super.viewDidLoad()
        json.getData(urlString: json.startJSONUrl)
        
        
        for i in json.countriesList {
            let imageHandler = ImageHandler()
            imageHandler.getImage(url: i.country_info.flag, tableView: tableView)
            
            flags?.append(imageHandler.downloadedImage!)
            
            
            
        }
        tableView.reloadData()
        
       
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.countriesList.count
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as! CountryCell
        cell.countryName.text = json.countriesList[indexPath.row].name
        cell.countryCapital.text = json.countriesList[indexPath.row].capital
        //cell.additionalInformation.text = json.countriesList[indexPath.row].description_small
        
        
        if let image = flags?[indexPath.row] {
            cell.countryImage.image = image
        }
//        if indexPath.row == 0 {
//            let imageHandler = ImageHandler()
//            imageHandler.getImage(url: json.countriesList[indexPath.row].image )
//            print("The URL is \(json.countriesList[indexPath.row].country_info.flag)")
//            cell.countryImage.image = imageHandler.downloadedImage
//        }
       
        let info = json.countriesList[indexPath.row].description_small
        
        if info == "" {
            cell.additionalInformation.isHidden = true
        } else {
            cell.additionalInformation.text = json.countriesList[indexPath.row].description_small
        }
        
        return cell
    }
}
