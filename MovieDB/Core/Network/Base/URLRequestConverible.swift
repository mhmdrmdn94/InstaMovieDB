//
//  URLRequestConverible.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias HTTPHeaders = [String:String]

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

protocol InstaURLRequestConvertible: URLRequestConvertible {
    var baseUrl:    String?         { get }
    var path:       String          { get }
    var headers:    HTTPHeaders?    { get }
    var method:     HTTPMethod      { get }
    var parameters: Parameters?     { get }
    var parametersEncoding: ParametersEncoding { get }
}


extension InstaURLRequestConvertible {
    var baseUrl: String? {
        return nil
    }
    var headers: HTTPHeaders? {
        return nil
    }
    var parameters: Parameters? {
        return nil
    }
    var parametersEncoding: ParametersEncoding {
        return ParametersEncoding.query
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try (baseUrl ?? Constants.baseAPIURL).asURL()
        let urlWithPath = url.appendingPathComponent(path)
        var urlRequest = URLRequest(url: urlWithPath)
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            urlRequest = try parametersEncoding.encode(request: urlRequest, parameters: params)
        }
        return urlRequest
    }
}


