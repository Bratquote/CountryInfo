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
    let infoSegue = "Info"
    
    var countriesList: [CountryJSON]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //useCoreData.deleteCountryCoreData()
        if ReachabilityTest.isConnectedToNetwork() {
            print("Connected to network")
            json.getData(urlString: json.startJSONUrl)
            countriesList = json.countriesList
        } else {
             print("Not connected to network")
            countriesList = useCoreData.getCountries()
        }
        
        
        refreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action:
                #selector(self.handleRefresh(_:)),
                                     for: UIControl.Event.valueChanged)
            refreshControl.tintColor = UIColor.orange
            
            return refreshControl
        }()
        
        tableView.addSubview(self.refreshControl!)
        tableView.reloadData()
        
    }
    
    
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        DispatchQueue.main.async {
            self.json.refreshTable(urlString: self.json.startJSONUrl, tableView: self.tableView)
        }
       
        
        
            //countriesList = json.countriesList
            
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == countriesList.count - 1 {
            if ReachabilityTest.isConnectedToNetwork() {
                if let nextJSON = json.nextJSONUrl {
                    json.getData(urlString: nextJSON)
                    countriesList += json.countriesList
                    json.nextJSONUrl = nil
                    tableView.reloadData()
                }
            }
            
            
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: infoSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Info" {
            let vc = segue.destination as! CountryInfoVC
            vc.currentCountry = countriesList[(tableView.indexPathForSelectedRow?.row)!]
        }
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if countriesList[indexPath.row].description_small == "" {
            return 65
        } else {
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as! CountryCell
        let country = countriesList[indexPath.row]
        cell.countryName.text = country.name
        cell.countryCapital.text = country.capital
        
        
        if ReachabilityTest.isConnectedToNetwork() {
        if let data = JSONHandler.imageDictionary[country.country_info.flag] {
            cell.flag.image = UIImage(data: data)
        } else {
            print(JSONHandler.imageDictionary[country.country_info.flag])
            print(JSONHandler.imageDictionary.count)
            let ih = ImageHandler()
             ih.getImageAndPasteIntoCell(urlString: country.country_info!.flag!, cell: cell)
        }
       
        } else {
            if let data = useCoreData.getImageFromCoreData(url: country.country_info.flag) {
                cell.flag.image = UIImage(data: data)
            }
        }
       
        
        let info = country.description_small
        if info == "" {
            cell.additionalInformation.isHidden = true
            updateViewConstraints()
        } else {
            cell.additionalInformation.text = country.description_small
        }
        
        return cell
    }
    
    
    //Allow us to back to this view from CountryInfoVC
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
}
