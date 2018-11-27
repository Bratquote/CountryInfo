//
//  CountryCell.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var additionalInformation: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func Cell(countryName: String) -> CountryCell {
        let cell: CountryCell = CountryCell()
        return cell
    }
    
}
