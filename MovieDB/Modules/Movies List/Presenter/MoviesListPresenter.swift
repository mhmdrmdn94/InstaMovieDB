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
    
    func getNumberOfRows() -> Int {
        return interactor.getNumberOfRows()
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
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    func didLoadMoviesSuccessfully() {
        view.hideLoaderState()
        view.reloadData()
    }
    
    func didFailToLoadMovies(error: Error) {
        view.hideLoaderState()
        view.showErrorMessage(error.localizedDescription)
    }
    
    func didLoadMoreMoviesSuccessfully() {
        view.hideFooterLoaderView()
        view.reloadData()
    }
    
    func didFailToLoadMoreMovies(error: Error) {
        view.hideFooterLoaderView()
        view.showErrorMessage(error.localizedDescription)
    }
}

