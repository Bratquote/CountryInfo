//
//  ImageHandler.swift
//  CountryInfo
//
//  Created by Timur Karimov on 24/11/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation
import UIKit


class ImageHandler {
    
    var downloadedImage: UIImage?
    var URL_IMAGE = URL(string: "https://cdn.pixabay.com/photo/2015/10/24/21/30/abkhazia-1005013_960_720.png")
    
    
    
    func getImage2(urlString: String) {
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: urlString) {
                let data = try? Data(contentsOf: url)
                
                if let imageData = data {
                    if let image = UIImage(data: imageData){
                        self.downloadedImage = image
                    }
                    
                }
            }
        }
        
    }
    func getImage(url: String) {
        let session = URLSession(configuration: .default)
        
        //creating a dataTask
        if let URL_Image = URL(string: url) {
            let getImageFromUrl = session.dataTask(with: URL_Image) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        let image = UIImage(data: imageData)
                        print("Image was downloaded")
                        //displaying the image
                        self.downloadedImage = image
                       
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
        }
        
    }
}
