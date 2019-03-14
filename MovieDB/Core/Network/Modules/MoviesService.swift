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
        
        var parameters: Parameters = ["api_key": "acea91d2bff1c53e6604e4985b6989e2"]
        if let page = page {
            parameters["page"] = page.description
        }
        
        let router = MoviesRouter.getMovies(parameters: parameters)
        do {
            let request = try router.asURLRequest()
            let instaNetwork = InstaNetwork()
            instaNetwork.request(
                request: request,
                onSuccess: { (data, response) in
                    
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        if let json = jsonResponse as? [String:Any],
                            let moviesJson = json["results"] as? [[String:Any]] {
                            print(moviesJson)
                            
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                            let data = try JSONSerialization.data(withJSONObject: moviesJson, options: .prettyPrinted)
                            let movies = try decoder.decode([Movie].self, from: data)
                            print(movies)
                            onSuccess(movies)
                        }
                    } catch let error {
                        onFailure(.parsingFailed)
                    }
                    
            }) { (response, error) in
                print(error.localizedDescription)
                onFailure(.somethingWentWrong)
            }
        
        
        
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}
