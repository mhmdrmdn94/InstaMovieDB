//
//  InstaImageCacheTests.swift
//  MovieDBTests
//
//  Created by Mo-Ramadan Abdelhafez on 3/16/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import XCTest
@testable import MovieDB

class InstaImageCacheTests: XCTestCase {

    let originalImageValue = #imageLiteral(resourceName: "noresults")
    let originalImageKey = "sad-emoji"
    
    func testSingleton() {
        let firstCacheObject = InstaImageCache.shared
        let secondCacheObject = InstaImageCache.shared
        XCTAssertTrue(firstCacheObject === secondCacheObject, "A new InstaImageCache object always created again and again!")
    }
    
    func testAddImageToCache() {
        let instaImageCache = InstaImageCache.shared
        instaImageCache.addImageToCache(image: originalImageValue, urlString: originalImageKey)
        
        let cache = instaImageCache.getWholeCache()
        let retrievedImage = cache.object(forKey: originalImageKey as AnyObject) as? UIImage
        
        if let image = retrievedImage {
            XCTAssertTrue(image == originalImageValue, "cachedImage is not the same original one!")
        } else {
            XCTAssertTrue(false, "No image cached with that key!")
        }
    }
    
    func testRetrieveImageFromCache() {
        let instaImageCache = InstaImageCache.shared
        instaImageCache.addImageToCache(image: originalImageValue, urlString: originalImageKey)
        
        if let retrievedImage =  instaImageCache.getImageFromCache(urlString: originalImageKey) {
            XCTAssertTrue(retrievedImage == originalImageValue, "cachedImage is not the same original one!")
        } else {
            XCTAssertTrue(false, "No image cached with that key!")
        }
    }
}
