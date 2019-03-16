//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

struct MovieViewModel: Equatable {
    var title: String?
    var overview: String?
    var releaseDate: Date?
    var posterImageUrlString: String?
    var localPosterImage: UIImage?   //for thos movies which created locally
    
    var dateString: String {
        if let date = releaseDate {
            let dateString = InstaDateFormatter.shared.getString(date: date, format: "MMMM yyyy")
            return dateString
        } else {
            return "release date N/A"
        }
    }
    
    //MARK: I have added this just to make UnitTesting much easier
    static func == (lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
        let equalTitles = (lhs.title == rhs.title)
        let equalOverviews = (lhs.overview == rhs.overview)
        let equalReleaseDates = (lhs.releaseDate == rhs.releaseDate)
        let equalImageUrl = (lhs.posterImageUrlString == rhs.posterImageUrlString)
        let equalLocalImage = (lhs.localPosterImage == rhs.localPosterImage)
        let equalDateStrings = (lhs.dateString == rhs.dateString)
        let areEqual = (equalTitles && equalOverviews && equalReleaseDates && equalImageUrl && equalLocalImage && equalDateStrings)
        return areEqual
    }
}
