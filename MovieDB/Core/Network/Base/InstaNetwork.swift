//
//  InstaNetwork.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/12/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

protocol NetworkProtocol {
    typealias OnSuccessCallback = (Data, URLResponse?) -> ()
    typealias OnFailureCallback = (URLResponse?, Error) -> ()
    
    func request(request: URLRequest, onSuccess: @escaping OnSuccessCallback, onFailure: @escaping OnFailureCallback)
}


class InstaNetwork: NetworkProtocol {
    
    func request(request: URLRequest,
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
    
    private func requestWillBeSent(request: URLRequest) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private func responseded(response: URLResponse) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
