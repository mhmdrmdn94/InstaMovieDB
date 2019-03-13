//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

struct MovieViewModel {
    var title: String?
    var overview: String?
    var releaseDate: Date?
    var posterImageUrlString: String?
    
    var dateString: String {
        if let date = releaseDate {
            let dateString = InstaDateFormatter.shared.getString(date: date, format: "MMMM yyyy")
            return dateString
        } else {
            return "release date N/A"
        }
    }
}
