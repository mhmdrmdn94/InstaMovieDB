//
//  URLRequestConverible.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    var baseUrl:    String?         { get }
    var path:       String          { get }
    var parameters: Parameters?     { get }
    var headers:    HTTPHeaders     { get }
    var method:     HTTPMethod      { get }
}
