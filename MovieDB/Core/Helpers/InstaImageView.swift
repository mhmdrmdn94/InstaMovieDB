//
//  InstaImageView.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/13/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class InstaImageView: UIImageView {
    
    private var imageUrlString: String?
    
    func setImage(withUrl url: URL) {
        self.imageUrlString = url.absoluteString
        
        let cachedImage = InstaImageCache.shared.getImageFromCache(urlString: url.absoluteString)
        if let image = cachedImage {
            self.setImage(image)
            return
        }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let strongSelf = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let imageData = data, let image = UIImage(data: imageData) {
                InstaImageCache.shared.addImageToCache(image: image, urlString: url.absoluteString)
                if let imageUrlString = strongSelf.imageUrlString, imageUrlString == url.absoluteString {
                    strongSelf.setImage(image)
                }
            }
            
        }.resume()
    }
    
    private func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
    
}
