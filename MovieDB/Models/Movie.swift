//
//  Movie.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

public class Movie: Codable, Equatable {
    var movieId: Int
    var title: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: Date?
    var posterImage: UIImage?   //for local movies
    
    var fullPosterUrlString: String? {
        if let path = posterPath {
            let imageUrl = Constants.baseImagesUrl + path
            return imageUrl
        }
        return nil
    }
    init(movieId: Int, title: String?, overview: String?,
         posterPath: String?, posterImage: UIImage?, releaseDate: Date?) {
        self.movieId = movieId
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.posterImage = posterImage
    }
    
    enum CodingKeys: String, CodingKey {
        case title, overview
        case movieId = "id"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
    public static func == (lhs: Movie, rhs: Movie) -> Bool {
        let equalIds = (lhs.movieId == rhs.movieId)
        let equalTitles = (lhs.title == rhs.title)
        let equalOverviews = (lhs.overview == rhs.overview)
        let equalReleaseDates = (lhs.releaseDate == rhs.releaseDate)
        let equalPosterPath = (lhs.posterPath == rhs.posterPath)
        let equalPosterImage = (lhs.posterImage == rhs.posterImage)
        let equalFullUrl = (lhs.fullPosterUrlString == rhs.fullPosterUrlString)
        
        let areEqual = (equalIds && equalTitles && equalOverviews && equalReleaseDates && equalPosterPath && equalReleaseDates && equalPosterImage && equalFullUrl)
        return areEqual
    }
    
}
