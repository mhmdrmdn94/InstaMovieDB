//
//  InstaNetwork.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/12/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

public enum Result<Value> {
    case success(Value)
    case failure(Error)
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

public struct DataResponse<Value> {
    public let request: URLRequest?
    public let response: HTTPURLResponse?
    public let data: Data?
    public let result: Result<Value>
    public var value: Value? { return result.value }
    public var error: Error? { return result.error }
    public init(request: URLRequest?,
                response: HTTPURLResponse?,
                data: Data?,
                result: Result<Value>) {
        self.request = request
        self.response = response
        self.data = data
        self.result = result
    }
}



final class InstaNetwork {
    typealias OnSuccessCallback = (Data, URLResponse?) -> ()
    typealias OnFailureCallback = (URLResponse?, Error) -> ()
    
    private init() {}
    
    static func request(request: URLRequest,
                        onSuccess: @escaping OnSuccessCallback,
                        onFailure: @escaping OnFailureCallback) {
        
        requestWillBeSent(request: request)
        debugPrint(request)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                onFailure(response, error)
            }
            if let data = data {
                onSuccess(data, response)
            }
        }
        
        task.resume()
    }
    
    private static func requestWillBeSent(request: URLRequest) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private static func responseded(response: URLResponse) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
