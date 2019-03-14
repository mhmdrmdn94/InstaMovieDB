//
//  InstaNetworkError.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/14/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation


//TODO: split this to two different enums which conform a single protocol

enum InstaNetworkError: Int, Error {
    //custom error
    case parsingFailed = 0
    case somethingWentWrong = 1
    case invalidUrl = 2
    
    //real errors with real codes
    case noInternetConnection = -1009
    case notAuthorized = 401
    case endpointNotFound = 404
    
}
