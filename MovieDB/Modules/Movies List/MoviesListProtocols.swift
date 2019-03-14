//
//  MoviesListProtocols.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

protocol MoviesListViewProtocol: class {
    func reloadData()
    func reloadCellAt(indexPath: IndexPath)
    func showLoaderState()
    func hideLoaderState()
    func showFooterLoaderView()
    func hideFooterLoaderView()
    func showEmptyState(withType type: InstaEmptyStateType)
    func hideEmptyState()
    func showErrorMessage(_ message: String)
}

protocol MoviesListPresenterProtocol: class {
    func loadMovies()
    func loadMoreMovies()
    func getNumberOfSections() -> Int
    func getNumberOfRows(atSection section: Int) -> Int
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel?
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie?
    func getHasMorePages() -> Bool
    func openCreateMovieViewController()
}

protocol MoviesListInteractorProtocol: class {
    func loadMovies()
    func loadMoreMovies()
    func getIsDataSourceEmpty() -> Bool
    func getNumberOfSections() -> Int
    func getNumberOfRows(atSection section: Int) -> Int
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel?
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie?
    func getHasMorePages() -> Bool
    func addNewCreatedMovie(_ movie: Movie)
}

protocol MoviesListInteractorOutputProtocol: class {
    func didLoadMoviesSuccessfully()
    func didFailToLoadMovies(error: InstaNetworkError)
    func didLoadMoreMoviesSuccessfully()
    func didFailToLoadMoreMovies(error: InstaNetworkError)
    func didCreateNewMovie()
    func didFailToCreateNewMovie(error: InstaNetworkError)
}

protocol MoviesListWireframeProtocol: class {
    func openCreateNewMovieModule(view: MoviesListViewProtocol, delegate: MovieCreationDelegate)
}

protocol MoviesListBuilderProtocol: class {
    func buildMoviesListModule() -> UIViewController
}
