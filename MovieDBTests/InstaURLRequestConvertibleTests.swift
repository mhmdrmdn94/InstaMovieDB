//
//  InstaURLRequestConvertibleTests.swift
//  MovieDBTests
//
//  Created by Mo-Ramadan Abdelhafez on 3/16/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import XCTest
@testable import MovieDB

class InstaURLRequestConvertibleTests: XCTestCase {
    
    func testURLRequestBuilder() {
        let params: Parameters = ["instaKey": "instaValue",
                                  "api_key": "acea91d2bff1c53e6604e4985b6989e2" ]
        let router = MoviesRouter.getMovies(parameters: params)
        
        do {
            let requset = try router.asURLRequest()
            
            let expectedURLString = Constants.baseAPIURL + "discover/movie?instaKey=instaValue&api_key=acea91d2bff1c53e6604e4985b6989e2"
            let expectedHttpMethod = HTTPMethod.get.rawValue
            let expectedHeaders: HTTPHeaders? = [:]
            
            let actualURLString = requset.url?.absoluteString
            let actualMethod = requset.httpMethod
            let actualHeaders = requset.allHTTPHeaderFields
            
            XCTAssertEqual(expectedHeaders, actualHeaders, "HTTPHeaders does not match!")
            XCTAssertEqual(expectedURLString, actualURLString, "URLStrings does not match!")
            XCTAssertEqual(expectedHttpMethod, actualMethod, "HTTPMethods does not match!")
            
        } catch let error {
            XCTAssertTrue(false, error.localizedDescription)
        }
    }

}
