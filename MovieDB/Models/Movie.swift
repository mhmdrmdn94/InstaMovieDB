//
//  Movie.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

public class Movie: BaseModel {
    var movieId: String
    var title: String?
    var overview: String?
    var posterUrlString: String?
    var releaseDate: Date?
    
    init(movieId: String, title: String?, overview: String?, posterUrlString: String?, releaseDate: Date?) {
        self.movieId = movieId
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterUrlString = posterUrlString
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    enum CodingKeys: String, CodingKey {
        case title, overview
        case movieId = "id"
        case posterUrlString = "poster_path"
        case releaseDate = "release_date"
    }
    
}
