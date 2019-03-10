//
//  MoviesListInteractor.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

class MoviesListInteractor: MoviesListInteractorProtocol {
   
    weak var presenter: MoviesListInteractorOutputProtocol?
    
    fileprivate var movies = [Movie]()
    fileprivate var hasNextPage = true
    fileprivate var nextPageNumber = 1
    
    
    func loadMovies() {
        //TODO: call the movies service to load movies
    }
    
    func loadMoreMovies() {
        //TODO: call movies service with nextPageNumber
    }
    
    func getNumberOfSections() -> Int {
        //TODO: check for MyMovies and AllMovies
        return 1
    }
    func getNumberOfRows(atSection section: Int) -> Int {
        //TODO: check for MyMovies and AllMovies
        return movies.count
    }
    
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel? {
        if indexPath.row < movies.count {
            let model = movies[indexPath.row]
            let viewModel = self.getMovieViewModel(fromMovie: model)
            return viewModel
        }
        return nil
    }
    
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie? {
        if indexPath.row < movies.count {
            let movie = movies[indexPath.row]
            return movie
        }
        return nil
    }
    
    func getHasMorePages() -> Bool {
        return true
    }
}

fileprivate extension MoviesListInteractor {
    func getMovieViewModel(fromMovie movie: Movie) -> MovieViewModel {
        var viewModel = MovieViewModel()
        viewModel.title = movie.title
        viewModel.overview = movie.overview
        viewModel.releaseDate = movie.releaseDate
        viewModel.posterUrlString = movie.posterUrlString
        return viewModel
    }
}
