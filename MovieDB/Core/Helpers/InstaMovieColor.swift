//
//  InstaMovieColor.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

enum InstaMovieColor {
    case primary
    case secondry
    case custom(hexString: String, alpha: Double)
    
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
    
    var value: UIColor {
        switch self {
        case .primary:
            return UIColor(hexString: "#081c24")    //blue
            
        case .secondry:
            return UIColor(hexString: "#01d277")    //green
           
        case .custom(let hexString, let alpha):
            return UIColor(hexString: hexString).withAlphaComponent(CGFloat(alpha))
            
        }
    }
}

