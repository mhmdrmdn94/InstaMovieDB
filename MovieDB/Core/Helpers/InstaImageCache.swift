//
//  InstaImageCache.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/13/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

protocol ImageCacheProtocol {
    func addImageToCache(image: UIImage, urlString: String)
    func getImageFromCache(urlString: String) -> UIImage?
}

class InstaImageCache: NSObject, ImageCacheProtocol {
    static let shared = InstaImageCache()
    private let imageCache = NSCache<AnyObject, AnyObject>()
    private override init() { }
    
    
    func addImageToCache(image: UIImage, urlString: String) {
        imageCache.setObject(image, forKey: urlString as AnyObject)
    }
    
    func getImageFromCache(urlString: String) -> UIImage? {
        let image = imageCache.object(forKey: urlString as AnyObject) as? UIImage
        return image
    }
}
