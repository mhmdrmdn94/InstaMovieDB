//
//  InstaNetworkError.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/14/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

enum InstaNetworkError: Error {
    case noInternetConnection
    case endpointNotFound
    case parsingFailed
    case notAuthorized
    case somethingWentWrong
    case invalidUrl
}
