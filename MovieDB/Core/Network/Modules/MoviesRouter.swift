//
//  MoviesRouter.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/12/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

enum MoviesRouter: InstaURLRequestConvertible {
    case getMovies(parameters: Parameters)
    
    var path: String {
        switch self {
        case .getMovies: return "discover/movie"
        }
    }
    var parameters: Parameters? {
        switch self {
        case .getMovies(let parameters): return parameters
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getMovies: return .get
        }
    }
    
}

