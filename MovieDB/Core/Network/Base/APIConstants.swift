//
//  APIConstants.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

//http://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2&page=1

fileprivate enum APIConstants: String {
    case baseUrl = "http://themoviedb.org"
    case baseAPIUrl = "http://api.themoviedb.org/3/"
    case baseImagesUrl = "https://image.tmdb.org/t/p/w200"
    case apiKey = "acea91d2bff1c53e6604e4985b6989e2"
}

fileprivate enum Environment {
    case debug
    case release
    
    static var current: Environment {
        return .release
    }
}

struct Constants {
    private init() {}
    static fileprivate let environment = Environment.current
    
    static var baseURL: String {
        switch environment {
        case .debug:
            return APIConstants.baseUrl.rawValue
        case .release:
            return APIConstants.baseUrl.rawValue
        }
    }
    
    static var baseAPIURL: String {
        switch environment {
        case .debug:
            return APIConstants.baseAPIUrl.rawValue
        case .release:
            return APIConstants.baseAPIUrl.rawValue
        }
    }
    
    static var apiKay: String {
        switch environment {
        case .debug:
            return APIConstants.apiKey.rawValue
        case .release:
            return APIConstants.apiKey.rawValue
        }
    }
    
    static var baseImagesUrl: String {
        switch environment {
        case .debug:
            return APIConstants.baseImagesUrl.rawValue
        case .release:
            return APIConstants.baseImagesUrl.rawValue
        }
    }
}
