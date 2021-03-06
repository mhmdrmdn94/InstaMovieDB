//
//  MoviesListPresenter.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol {
    fileprivate unowned var view: MoviesListViewProtocol
    fileprivate var interactor: MoviesListInteractorProtocol
    fileprivate var wireframe: MoviesListWireframeProtocol
    
    //TODO: add view state to determine which view is presented [ .hasData, .loadingData, .loadingMoreDate, .emptyState, .errorState ]
    
    
    init(view: MoviesListViewProtocol,
         interactor: MoviesListInteractorProtocol,
         wireframe: MoviesListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func loadMovies() {
        view.showLoaderState()
        interactor.loadMovies()
    }
    
    func loadMoreMovies() {
        view.showFooterLoaderView()
        interactor.loadMoreMovies()
    }
    
    func getNumberOfSections() -> Int {
        return interactor.getNumberOfSections()
    }
    
    func getNumberOfRows(atSection section: Int) -> Int {
        return interactor.getNumberOfRows(atSection: section)
    }
    
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel? {
        return interactor.getMovieViewModelAt(indexPath)
    }
    
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie? {
        return interactor.getMovieModelAt(indexPath)
    }
    
    func getHasMorePages() -> Bool {
        return interactor.getHasMorePages()
    }
    
    func openCreateMovieViewController() {
        wireframe.openCreateNewMovieModule(view: view, delegate: self)
    }
    
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    func didLoadMoviesSuccessfully() {
        view.hideLoaderState()
        view.reloadData()
        if interactor.getIsDataSourceEmpty() {
            view.showEmptyState(withType: .noResultsFound)
        }
    }
    
    func didFailToLoadMovies(error: InstaNetworkError) {
        view.hideLoaderState()
        var type = InstaEmptyStateType.somethingWentWrong
        switch error {
        case .noInternetConnection:
            type = .noInternetConnection
        default:
            type = .somethingWentWrong
        }
        view.showEmptyState(withType: type)
    }
    
    func didLoadMoreMoviesSuccessfully() {
        view.hideFooterLoaderView()
        view.reloadData()
    }
    
    func didFailToLoadMoreMovies(error: InstaNetworkError) {
        view.hideFooterLoaderView()
        view.showErrorMessage(error.localizedDescription)
    }
    
    func didCreateNewMovie() {
        view.hideLoaderState()
        view.reloadData()
    }
    
    func didFailToCreateNewMovie(error: InstaNetworkError) {
        view.showErrorMessage(error.localizedDescription)
    }
}

extension MoviesListPresenter: MovieCreationDelegate {
    func didCreateNewMovie(_ movie: Movie) {
        view.showLoaderState()
        interactor.addNewCreatedMovie(movie)
    }
}
