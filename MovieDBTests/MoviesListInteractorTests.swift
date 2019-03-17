//
//  MoviesListInteractorTests.swift
//  MovieDBTests
//
//  Created by Mo-Ramadan Abdelhafez on 3/16/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import XCTest
@testable import MovieDB

class MoviesListInteractorTests: XCTestCase {
    
    var interactor: MoviesListInteractor!
    var moviesService: MoviesServiceProtocol!
    override func setUp() {
        super.setUp()
        moviesService = MockMoviesService()
        interactor = MoviesListInteractor(moviesService: moviesService)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsDataSourceEmptyGetter() {
        XCTAssertTrue(interactor.getIsDataSourceEmpty(), "Expected data source is empty while it isn't!")
        loadInteractorMovies()
        let actualValue = interactor.getIsDataSourceEmpty()
        let expectedValue = false
        XCTAssertTrue(actualValue == expectedValue, "Datasource should not be empty!")
    }
    
    func testNumberOfRowsInOnlineMovies() {
        var numberOfOnlineMovies = interactor.getNumberOfRows(atSection: MoviesSectionType.allMovies.rawValue)
        XCTAssertTrue(numberOfOnlineMovies == 0, "number of online movies is not correct")
        loadInteractorMovies()
        numberOfOnlineMovies = interactor.getNumberOfRows(atSection: MoviesSectionType.allMovies.rawValue)
        XCTAssertTrue(numberOfOnlineMovies == 2, "number of online movies is not correct")
    }
    
    func testModelViewModelConvrter() {
        let model = Movie(movieId: 1, title: "Title", overview: "Overview",
                          posterPath: "image.png", posterImage: nil, releaseDate: nil)
        let fullImagePath = Constants.baseImagesUrl + "image.png"
        let expectedViewModel = MovieViewModel(title: "Title", overview: "Overview",
                                       releaseDate: nil, posterImageUrlString: fullImagePath, localPosterImage: nil)
        let actualViewModel = interactor.getMovieViewModel(fromMovie: model)
        XCTAssertEqual(actualViewModel, expectedViewModel, "Model-ViewModel converter is not working properly")
    }
    
    func testViewModelGetter() {
        let expectedViewModel = MovieViewModel(title: "Hello-1", overview: "Overview", releaseDate: nil, posterImageUrlString: nil, localPosterImage: #imageLiteral(resourceName: "noresults"))
        loadInteractorMovies()
        let indexPath = IndexPath(row: 0, section: MoviesSectionType.allMovies.rawValue)
        let actualViewModel = interactor.getMovieViewModelAt(indexPath)
        XCTAssertEqual(actualViewModel, expectedViewModel, "getViewModel(indexPath) is retrieving wrong view models")
    }
    
    func testMovieModelGetter() {
        let movie1 = Movie(movieId: 1, title: "Hello-1", overview: "Overview", posterPath: nil, posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: nil)
        loadInteractorMovies()
        let indexPath = IndexPath(row: 0, section: MoviesSectionType.allMovies.rawValue)
        let actualModel = interactor.getMovieModelAt(indexPath)
        XCTAssertEqual(actualModel, movie1, "getModel(indexPath) is retrieving wrong models")
    }
    
    func testAddNewMovie() {
        let myNewMovie = Movie(movieId: 1, title: "MyMovie", overview: "MyOverview", posterPath: nil, posterImage: #imageLiteral(resourceName: "default-poster"), releaseDate: nil)
        interactor.addNewCreatedMovie(myNewMovie)
        let indexPath = IndexPath(row: 0, section: MoviesSectionType.myMovies.rawValue)
        let actualMovie = interactor.getMovieModelAt(indexPath)
        XCTAssertEqual(actualMovie, myNewMovie, "add new movie is not working fine!")
        loadInteractorMovies()
        XCTAssertEqual(actualMovie, myNewMovie, "add new movie is not working fine!")
    }
    
    func testLoadMovies() {
        var numberOfOnlineMovies = interactor.getNumberOfRows(atSection: MoviesSectionType.allMovies.rawValue)
        XCTAssertTrue(numberOfOnlineMovies == 0, "number of online movies is not correct")
        interactor.loadMovies()
        numberOfOnlineMovies = interactor.getNumberOfRows(atSection: MoviesSectionType.allMovies.rawValue)
        XCTAssertTrue(numberOfOnlineMovies == 2, "number of online movies is not correct")
        
        let expectedMovie = Movie(movieId: 2, title: "Hello-2", overview: "Overview", posterPath: nil, posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: nil)
        let indexPath = IndexPath(row: 1, section: MoviesSectionType.allMovies.rawValue)
        let actualMovie = interactor.getMovieModelAt(indexPath)
        XCTAssertEqual(actualMovie, expectedMovie, "movies are not loaded correctly!")
    }
    
    //MARK: Helper methods
    private func loadInteractorMovies() {
        interactor.loadMovies()
    }
}

fileprivate class MockMoviesService: MoviesServiceProtocol {
    func getMovies(page: Int?, onSuccess: @escaping ([Movie]) -> (),
                   onFailure: @escaping (InstaNetworkError) -> ()) {
        
        let movie1 = Movie(movieId: 1, title: "Hello-1", overview: "Overview", posterPath: nil, posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: nil)
        let movie2 = Movie(movieId: 2, title: "Hello-2", overview: "Overview", posterPath: nil, posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: nil)
        let movie3 = Movie(movieId: 3, title: "Hello-3", overview: "Overview", posterPath: nil, posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: nil)
        let movie4 = Movie(movieId: 4, title: "Hello-4", overview: "Overview", posterPath: nil, posterImage: #imageLiteral(resourceName: "noresults"), releaseDate: nil)
        
        if let page = page {
            if page == 1 {
                onSuccess([movie1, movie2])
            } else if page == 2 {
                onSuccess([movie3, movie4])
            } else {
                onSuccess([])
            }
        } else {
            onSuccess([movie1, movie2])
        }
    }
}
