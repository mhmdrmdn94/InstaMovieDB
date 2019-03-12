//
//  Movie.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

public class Movie: Codable {
    var movieId: Int
    var title: String?
    var overview: String?
    var posterUrlString: String?
    var releaseDate: Date?
    var posterImage: UIImage?
    
    init(movieId: Int, title: String?, overview: String?,
         posterUrlString: String?, posterImage: UIImage?, releaseDate: Date?) {
        self.movieId = movieId
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterUrlString = posterUrlString
        self.posterImage = posterImage
    }
    
    enum CodingKeys: String, CodingKey {
        case title, overview
        case movieId = "id"
        case posterUrlString = "poster_path"
        case releaseDate = "release_date"
    }
    
}
