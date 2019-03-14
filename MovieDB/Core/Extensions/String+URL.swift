//
//  String+URL.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/14/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//
import Foundation

extension String {
    func asURL() throws -> URL {
        if let url = URL(string: self) {
            return url
        } else {
            throw InstaNetworkError.invalidUrl
        }
    }
    
    
}
