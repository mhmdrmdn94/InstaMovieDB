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
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    func didLoadMoviesSuccessfully() {
        //TODO: check if datasource is empty, then show empty state
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

