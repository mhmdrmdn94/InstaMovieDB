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
    func showEmptyState()
    func hideEmptyState()
    func showErrorMessage(_ message: String)
}

protocol MoviesListPresenterProtocol: class {
    func loadMovies()
    func loadMoreMovies()
    func getNumberOfRows() -> Int
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel?
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie?
    func getHasMorePages() -> Bool
}

protocol MoviesListInteractorProtocol: class {
    func loadMovies()
    func loadMoreMovies()
    func getNumberOfRows() -> Int
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel?
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie?
    func getHasMorePages() -> Bool
}

protocol MoviesListInteractorOutputProtocol: class {
    func didLoadMoviesSuccessfully()
    func didFailToLoadMovies(error: Error)
    func didLoadMoreMoviesSuccessfully()
    func didFailToLoadMoreMovies(error: Error)
}

protocol MoviesListWireframeProtocol: class {
    func openCreateNewMovieModule(view: MoviesListViewProtocol)
}

protocol MoviesListBuilderProtocol: class {
    func buildMoviesListModule() -> UIViewController
}
