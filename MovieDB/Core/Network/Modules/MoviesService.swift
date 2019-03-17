//
//  MoviesService.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/12/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

protocol MoviesServiceProtocol {
    func getMovies(page: Int?, onSuccess: @escaping ([Movie]) -> (), onFailure: @escaping (InstaNetworkError) -> ())
}

class MoviesService: NSObject, MoviesServiceProtocol {
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func getMovies(page: Int? = nil,
                   onSuccess: @escaping ([Movie]) -> (),
                   onFailure: @escaping (InstaNetworkError) -> ()) {
        
        var parameters: Parameters = ["api_key": Constants.apiKay]
        if let page = page {
            parameters["page"] = page.description
        }
        
        let router = MoviesRouter.getMovies(parameters: parameters)
        var urlRequest: URLRequest? = nil
        do {
            urlRequest = try router.asURLRequest()
        } catch let error {
            onFailure(error as! InstaNetworkError)
            return
        }
        guard let request = urlRequest else {
            return
        }
        
        InstaNetwork().request(request: request, onSuccess: { (data, response) in
            
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                if let json = jsonResponse as? [String:Any],
                    let moviesJson = json["results"] as? [[String:Any]] {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                    let data = try JSONSerialization.data(withJSONObject: moviesJson, options: .prettyPrinted)
                    let movies = try decoder.decode([Movie].self, from: data)
                    onSuccess(movies)
                }
            } catch {
                onFailure(.parsingFailed)
            }
            
        }) { (response, error) in
            let errorCode = (error as NSError).code
            if let instaError = InstaNetworkError(rawValue: errorCode) {
                onFailure(instaError)
            } else {
                onFailure(.somethingWentWrong)
            }
        }
    }
}
