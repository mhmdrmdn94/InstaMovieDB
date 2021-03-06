//
//  MoviesListInteractor.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

enum MoviesSectionType: Int {
    case myMovies = 0, allMovies
    
    var sectionTitle: String {
        switch self {
        case .myMovies:
            return "My Movies"
        case .allMovies:
            return "All Movies"
        }
    }
}

class MoviesListInteractor: MoviesListInteractorProtocol {
    weak var presenter: MoviesListInteractorOutputProtocol?
    
    fileprivate var moviesService: MoviesServiceProtocol
    fileprivate var mixedMovies: [[Movie]]
    fileprivate var hasNextPage = true
    fileprivate var nextPageNumber = 1
    fileprivate let moviesPerPage = 20
    
    init(moviesService: MoviesServiceProtocol) {
        self.moviesService = moviesService
        let myMovies = [Movie]()
        let allMovies = [Movie]()
        self.mixedMovies = [myMovies, allMovies]
    }
    
    func getIsDataSourceEmpty() -> Bool {
        let myMovies = mixedMovies[MoviesSectionType.myMovies.rawValue]
        let allMovies = mixedMovies[MoviesSectionType.allMovies.rawValue]
        if myMovies.isEmpty && allMovies.isEmpty {
            return true
        }
        return false
    }
    
    
    func loadMovies() {
        
        moviesService.getMovies(
            page: nextPageNumber,
            onSuccess: { [weak self] (movies) in
                
                guard let strongSelf = self else { return }
                if movies.count < strongSelf.moviesPerPage {
                    strongSelf.hasNextPage = false
                } else {
                    strongSelf.nextPageNumber = strongSelf.nextPageNumber + 1
                }
                
                var mutableMixedMovies = strongSelf.mixedMovies
                var mutableAllMovies = mutableMixedMovies[MoviesSectionType.allMovies.rawValue]
                mutableAllMovies = movies
                mutableMixedMovies.remove(at: MoviesSectionType.allMovies.rawValue)
                mutableMixedMovies.insert(mutableAllMovies, at: MoviesSectionType.allMovies.rawValue)
                strongSelf.mixedMovies = mutableMixedMovies
                strongSelf.presenter?.didLoadMoviesSuccessfully()
                
        }) { [weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.didFailToLoadMovies(error: error)
        }
    }
    
    func loadMoreMovies() {
        moviesService.getMovies(
            page: nextPageNumber,
            onSuccess: { [weak self] (movies) in
                
                guard let strongSelf = self else { return }
                if movies.count < strongSelf.moviesPerPage {
                    strongSelf.hasNextPage = false
                } else {
                    strongSelf.nextPageNumber = strongSelf.nextPageNumber + 1
                }
                
                var mutableMixedMovies = strongSelf.mixedMovies
                var mutableAllMovies = mutableMixedMovies[MoviesSectionType.allMovies.rawValue]
                mutableAllMovies.append(contentsOf: movies)
                mutableMixedMovies.remove(at: MoviesSectionType.allMovies.rawValue)
                mutableMixedMovies.insert(mutableAllMovies, at: MoviesSectionType.allMovies.rawValue)
                strongSelf.mixedMovies = mutableMixedMovies
                strongSelf.presenter?.didLoadMoreMoviesSuccessfully()
                
        }) { [weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.didFailToLoadMoreMovies(error: error)
        }
    }
    
    func getNumberOfSections() -> Int {
        return 2    //always has two sections
    }
    
    func getNumberOfRows(atSection section: Int) -> Int {
        guard let sectionType = MoviesSectionType(rawValue: section) else { return 0 }
        let movies = mixedMovies[sectionType.rawValue]
        return movies.count
    }
    
    func getMovieModelAt(_ indexPath: IndexPath) -> Movie? {
        guard let sectionType = MoviesSectionType(rawValue: indexPath.section),
            mixedMovies.count > sectionType.rawValue else {
                return nil
        }
        
        let movies = mixedMovies[sectionType.rawValue]
        if indexPath.row < movies.count {
            let movie = movies[indexPath.row]
            return movie
        }
        return nil
    }
    
    func getMovieViewModelAt(_ indexPath: IndexPath) -> MovieViewModel? {
        guard let sectionType = MoviesSectionType(rawValue: indexPath.section),
            mixedMovies.count > sectionType.rawValue else {
                return nil
        }
        
        let movies = mixedMovies[sectionType.rawValue]
        if indexPath.row < movies.count {
            let model = movies[indexPath.row]
            let viewModel = self.getMovieViewModel(fromMovie: model)
            return viewModel
        }
        return nil
    }
    
    func getMovieViewModel(fromMovie movie: Movie) -> MovieViewModel {
        var viewModel = MovieViewModel()
        viewModel.title = movie.title
        viewModel.overview = movie.overview
        viewModel.releaseDate = movie.releaseDate
        viewModel.localPosterImage = movie.posterImage
        viewModel.posterImageUrlString = movie.fullPosterUrlString
        return viewModel
    }
    
    func getHasMorePages() -> Bool {
        return hasNextPage
    }
    
    func addNewCreatedMovie(_ movie: Movie) {
        var mutableMixedMovies = mixedMovies
        var mutableMovies = mutableMixedMovies[MoviesSectionType.myMovies.rawValue]
        mutableMovies.append(movie)
        mutableMixedMovies.remove(at: MoviesSectionType.myMovies.rawValue)
        mutableMixedMovies.insert(mutableMovies, at: MoviesSectionType.myMovies.rawValue)
        self.mixedMovies = mutableMixedMovies
        self.presenter?.didCreateNewMovie()
    }
    
}
