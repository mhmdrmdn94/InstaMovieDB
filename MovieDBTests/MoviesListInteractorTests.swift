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
    
    override func setUp() {
        let viewController = MoviesListViewController()
        let wireframe = MoviesListWireframe()
        let service = MoviesService()
        interactor = MoviesListInteractor(moviesService: service)
        let presenter = MoviesListPresenter(view: viewController,
                                            interactor: interactor,
                                            wireframe: wireframe)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIsDataSourceEmptyGetter() {
        let isEmpty = interactor.getIsDataSourceEmpty()
        XCTAssertTrue(isEmpty, "isEmptyDataSource getter is not working fine!")
    }
    
    func testMovieViewModelBuilderFromMovieModel() {
        let model = Movie(movieId: 1, title: "Title", overview: "Overview",
                          posterPath: "image.png", posterImage: nil, releaseDate: nil)
        let fullImagePath = Constants.baseImagesUrl + "image.png"
        let viewModel = MovieViewModel(title: "Title", overview: "Overview",
                                       releaseDate: nil, posterImageUrlString: fullImagePath, localPosterImage: nil)
        
        let builtViewModel = interactor.getMovieViewModel(fromMovie: model)
        XCTAssertTrue( builtViewModel == viewModel , "ViewModels are not built correctly!")
    }
    
    func testAddNewCreatedMoview() {
        let model = Movie(movieId: 1, title: "Title", overview: "Overview",
                          posterPath: "image.png", posterImage: nil, releaseDate: nil)
        interactor.addNewCreatedMovie(model)
        
        let allMixedMovies = interactor.getMixedMoviesDataSource()
        let myMovies = allMixedMovies[MoviesSectionType.myMovies.rawValue]
        if let movie = myMovies.last {
            XCTAssertTrue(movie == model, "New movie is not added!")
        } else {
            XCTAssertTrue(false, "New movie is not added!")
        }
    }
    
    func testNumberOfRowsGetter() {
        let model = Movie(movieId: 1, title: "Title", overview: "Overview",
                          posterPath: "image.png", posterImage: nil, releaseDate: nil)
        interactor.addNewCreatedMovie(model)
        interactor.addNewCreatedMovie(model)
        
        let myMoviesCount = interactor.getNumberOfRows(atSection: MoviesSectionType.myMovies.rawValue)
        XCTAssertTrue(myMoviesCount == 2, "NumberOfRows getter is not working properly!")
    }
    
    func testMovieModelGetter() {
        let model = Movie(movieId: 1, title: "Title", overview: "Overview",
                          posterPath: "image.png", posterImage: nil, releaseDate: nil)
        interactor.addNewCreatedMovie(model)
        
        let indexPath = IndexPath(row: 0, section: MoviesSectionType.myMovies.rawValue)
        let movie = interactor.getMovieModelAt(indexPath)
        if let movie = movie {
            XCTAssertTrue(model == movie, "movieModelAtIndexPath() is not working properly!")
        } else {
           XCTAssertTrue(false, "movieModelAtIndexPath() is not working properly!")
        }
        
    }
    
    func testMovieViewModelGetter() {
        let model = Movie(movieId: 1, title: "Title", overview: "Overview",
                          posterPath: "image.png", posterImage: nil, releaseDate: nil)
        let fullImagePath = Constants.baseImagesUrl + "image.png"
        let viewModel = MovieViewModel(title: "Title", overview: "Overview",
                                       releaseDate: nil, posterImageUrlString: fullImagePath, localPosterImage: nil)
        interactor.addNewCreatedMovie(model)
        
        let indexPath = IndexPath(row: 0, section: MoviesSectionType.myMovies.rawValue)
        let movieViewModel = interactor.getMovieViewModelAt(indexPath)
        if let movieViewModel = movieViewModel {
            XCTAssertTrue(movieViewModel == viewModel, "movieViewModelAtIndexPath() is not working properly!")
        } else {
            XCTAssertTrue(false, "movieViewModelAtIndexPath() is not working properly!")
        }
        
    }
}
