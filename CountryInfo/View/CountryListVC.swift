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
    let useCoreData = UseCoreData()
    
    var countriesList: [CountryJSON]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        json.getData(urlString: json.startJSONUrl)
        //countriesList = json.countriesList
        //useCoreData.deleteCoreData()
        countriesList = useCoreData.getCountries()
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "Info", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Info" {
            let vc = segue.destination as! CountryInfoVC
            vc.currentCountry = countriesList[(tableView.indexPathForSelectedRow?.row)!]
        }
       
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as! CountryCell
        cell.countryName.text = countriesList[indexPath.row].name
        cell.countryCapital.text = countriesList[indexPath.row].capital
        
        let ih = ImageHandler()
        //ih.getImageAndPasteIntoCell(urlString: countriesList[indexPath.row].country_info!.flag!, cell: cell)
        
        
        if let data2 = useCoreData.getImage(url: countriesList[indexPath.row].country_info.flag) {
            
             cell.countryImage.image = UIImage(data: data2)!
            }
       
        
        
        let info = countriesList[indexPath.row].description_small
        if info == "" {
            cell.additionalInformation.isHidden = true
            updateViewConstraints()
        } else {
            cell.additionalInformation.text = countriesList[indexPath.row].description_small
        }
        
        return cell
    }
}
