//
//  ParameterEncoding.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/14/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

public enum ParametersEncoding {
    case query, body
    
    func encode(request: URLRequest, parameters: Parameters) throws -> URLRequest {
        switch self {
        case .query:
            let request = try self.encodeQueryParams(request: request, parameters: parameters)
            return request
            
        case .body:
            //TODO: to be implemented later
            throw InstaNetworkError.somethingWentWrong
        }
    }
    
    
    private func encodeQueryParams(request: URLRequest, parameters: Parameters) throws -> URLRequest {
        guard let urlString = request.url?.absoluteString else {
            throw InstaNetworkError.invalidUrl
        }
        
        var queryItems = [URLQueryItem]()
        parameters.forEach { (key, value) in
            let queryItem = URLQueryItem(name: key, value: value as? String)
            queryItems.append(queryItem)
        }
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = queryItems
        var mutableRequest = request
        mutableRequest.url = urlComponents?.url
        return mutableRequest
    }
}
