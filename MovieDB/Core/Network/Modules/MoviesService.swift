//
//  MoviesService.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/12/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation


//TODO: this will be the  Router.URLRequest to call InstaNetwork to get data

class MoviesService: NSObject {
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func getMovies(page: Int? = nil,
                   onSuccess: @escaping ([Movie]) -> (),
                   onFailure: @escaping (Error) -> ()) {
        
        var urlString = "http://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2"
        if let page = page {
            urlString = urlString + "&page=" + page.description
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        InstaNetwork.request(
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
                } catch let parsingError {
                    onFailure(parsingError)
                }
                                
        }) { (response, error) in
            print(error.localizedDescription)
            onFailure(error)
        }
        
        
        
    }
}
