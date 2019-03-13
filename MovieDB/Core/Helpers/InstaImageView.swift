//
//  InstaImageView.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/13/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class InstaImageView: UIImageView {
    
    func setImage(withUrl url: URL) {
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let imageData = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
            
        }.resume()
    }
    
}
