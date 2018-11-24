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
    override func viewDidLoad() {
        super.viewDidLoad()
        json.getData(urlString: json.startJSONUrl)
        tableView.reloadData()
        
//        let url = URL(string: "https://www.apple.com")!
//        
//        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
//            if let localURL = localURL {
//                if let string = try? String(contentsOf: localURL) {
//                    print(string)
//                }
//            }
//        }
//        
//        task.resume()
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
        
        let info = json.countriesList[indexPath.row].description_small
        
        if info == "" {
            cell.additionalInformation.isHidden = true
        } else {
            cell.additionalInformation.text = json.countriesList[indexPath.row].description_small
        }
        
        return cell
    }
}
