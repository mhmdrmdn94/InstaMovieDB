//
//  MoviesListPresenterTests.swift
//  MovieDBTests
//
//  Created by Mo-Ramadan Abdelhafez on 3/17/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import XCTest
@testable import MovieDB

class MoviesListPresenterTests: XCTestCase {

    var presenter: MoviesListPresenter!
    var view: MockMoviesView!
    var interactor: MockMoviesInteractor!
    var wireframe: MockMoviesWireframe!
    
    override func setUp() {
        super.setUp()
        view = MockMoviesView()
        interactor = MockMoviesInteractor()
        wireframe = MockMoviesWireframe()
        presenter = MoviesListPresenter(view: view,
                                        interactor: interactor,
                                        wireframe: wireframe)
    }
    
    //MARK: test presenter >>> interactor
    func testLoadMovies() {
        interactor.loadMovies()
        XCTAssertTrue(interactor.didLoadMovies)
    }
    
    func testLoadMoreMovies() {
        interactor.loadMoreMovies()
        XCTAssertTrue(interactor.didLoadMoreMovies)
    }
    
    func testNumberOfSections() {
        interactor.getNumberOfSections()
        XCTAssertTrue(interactor.didGetNumberOfSections)
    }
    
    func testNumberOfRows() {
        interactor.getNumberOfRows(atSection: 0)
        XCTAssertTrue(interactor.didGetNumberOfRows)
    }
    
    func testGetViewModelAtIndex() {
        interactor.getMovieViewModelAt(IndexPath(row: 0, section: 0))
        XCTAssertTrue(interactor.didGetViewModelAtIndex)
    }
    
    func testGetViewModelFromModel() {
        let movie = Movie(movieId: 0, title: nil, overview: nil, posterPath: nil, posterImage: nil, releaseDate: nil)
        interactor.getMovieViewModel(fromMovie: movie)
        XCTAssertTrue(interactor.didGetViewModelFromModel)
    }
    
    func testGetModelAtIndex() {
        interactor.getMovieModelAt(IndexPath(row: 0, section: 0))
        XCTAssertTrue(interactor.didGetModelAtIndex)
    }
    
    func testGetHasMorePages() {
        interactor.getHasMorePages()
        XCTAssertTrue(interactor.didGetHasMorePages)
    }
    
    func testAddNewMovie() {
        let movie = Movie(movieId: 0, title: nil, overview: nil, posterPath: nil, posterImage: nil, releaseDate: nil)
        interactor.addNewCreatedMovie(movie)
        XCTAssertTrue(interactor.didAddNewMovie)
    }
    
    //MARK: test presenter >>> wireframe
    func testOpenCreateNewMovieScreen() {
        wireframe.openCreateNewMovieModule(view: view, delegate: presenter)
        XCTAssertTrue(wireframe.didOpenCreateMovieModule)
    }
    
    //MARK: test presenter >>> view
    func testReloadData() {
        view.reloadData()
        XCTAssertTrue(view.didReloadData)
    }
    
    func testReloadCellAtIndex() {
        view.reloadCellAt(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertTrue(view.didReloadCellAtIndex)
    }
    
    func testShowLoaderState() {
        view.showLoaderState()
        XCTAssertTrue(view.didShowLoaderState)
    }
    
    func testHideLoaderState() {
        view.hideLoaderState()
        XCTAssertTrue(view.didHideLoaderState)
    }
    
    func testShowFooterLoader() {
        view.showFooterLoaderView()
        XCTAssertTrue(view.didShowFooterLoader)
    }
    
    func testHideFooterLoader() {
        view.hideFooterLoaderView()
        XCTAssertTrue(view.didHideFooterLoader)
    }
    
    func testShowEmptyState() {
        view.showEmptyState(withType: .noInternetConnection)
        XCTAssertTrue(view.didShowEmptyStateWithType)
    }
    
    func testHideEmptyState() {
        view.hideEmptyState()
        XCTAssertTrue(view.didHideEmptyStateWithType)
    }
    
    func testShowErrorMessage() {
        view.showErrorMessage("")
        XCTAssertTrue(view.didShowErrorMessage)
    }
}


internal class MockMoviesView: MoviesListViewProtocol {
    
    var didReloadData = false
    var didReloadCellAtIndex = false
    var didShowLoaderState = false
    var didHideLoaderState = false
    var didShowFooterLoader = false
    var didHideFooterLoader = false
    var didShowEmptyStateWithType = false
    var didHideEmptyStateWithType = false
    var didShowErrorMessage = false
    
    func reloadData() {
        didReloadData = true
    }
    
    func reloadCellAt(indexPath: IndexPath) {
        didReloadCellAtIndex = true
    }
    
    func showLoaderState() {
        didShowLoaderState = true
    }
    
    func hideLoaderState() {
        didHideLoaderState = true
    }
    
    func showFooterLoaderView() {
        didShowFooterLoader = true
    }
    
    func hideFooterLoaderView() {
        didHideFooterLoader = true
    }
    
    func showEmptyState(withType type: InstaEmptyStateType) {
        didShowEmptyStateWithType = true
    }
    
    func hideEmptyState() {
        didHideEmptyStateWithType = true
    }
    
    func showErrorMessage(_ message: String) {
        didShowErrorMessage = true
    }
}

internal class MockMoviesWireframe: MoviesListWireframeProtocol {
    var didOpenCreateMovieModule = false
    
    func openCreateNewMovieModule(view: MoviesListViewProtocol, delegate: MovieCreationDelegate) {
        didOpenCreateMovieModule = true
    }
}

internal class MockMoviesInteractor: MoviesListInteractorProtocol {
    var didLoadMovies = false
    var didLoadMoreMovies = false
    var didGetIsDataSourceEmpty = false
    var didGetNumberOfRows = false
    var didGetNumberOfSections = false
    var didGetViewModelAtIndex = false
    var didGetViewModelFromModel = false
    var didGetModelAtIndex = false
    var didGetHasMorePages = false
    var didAddNewMovie = false
    
    func loadMovies() {
        didLoadMovies = true
    }
    
    func loadMoreMovies() {
        didLoadMoreMovies = true
    }
   
    func getIsDataSourceEmpty() -> Bool {
        didGetIsDataSourceEmpty = true
        return true
    }
    
    func getNumberOfSections() -> Int {
        didGetNumberOfSections = true
        return 0
    }
    
    func getNumberOfRows(atSection section: Int) -> Int {
        didGetNumberOfRows = true
        return 0
    }
    
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel? {
        didGetViewModelAtIndex = true
        return nil
    }
    
    func getMovieViewModel(fromMovie movie: Movie) -> MovieViewModel {
        didGetViewModelFromModel = true
        let viewModel = MovieViewModel()
        return viewModel
    }
    
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie? {
        didGetModelAtIndex = true
        return nil
    }
    
    func getHasMorePages() -> Bool {
        didGetHasMorePages = true
        return true
    }
    
    func addNewCreatedMovie(_ movie: Movie) {
        didAddNewMovie = true
    }
}
