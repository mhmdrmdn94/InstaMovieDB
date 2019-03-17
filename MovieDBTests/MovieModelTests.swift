//
//  MovieModelTests.swift
//  MovieDBTests
//
//  Created by Mo-Ramadan Abdelhafez on 3/17/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import XCTest
@testable import MovieDB

class MovieModelTests: XCTestCase {

    var movie: Movie!
    let releaseDate = Date()
    
    override func setUp() {
        super.setUp()
        movie = Movie(movieId: 101, title: "InstaMovie", overview: "Hola!", posterPath: "/insta.png", posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: releaseDate)
    }
    
    func testModelGetters() {
        XCTAssertEqual(movie.movieId, 101)
        XCTAssertEqual(movie.title, "InstaMovie")
        XCTAssertEqual(movie.overview, "Hola!")
        XCTAssertEqual(movie.posterPath, "/insta.png")
        XCTAssertEqual(movie.posterImage, #imageLiteral(resourceName: "noresults"))
        XCTAssertEqual(movie.releaseDate, releaseDate)
        
        let fullPosterPath = Constants.baseImagesUrl + "/insta.png"
        XCTAssertEqual(movie.fullPosterUrlString, fullPosterPath)
    }
}
