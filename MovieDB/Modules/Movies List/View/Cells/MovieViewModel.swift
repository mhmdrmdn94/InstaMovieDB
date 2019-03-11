//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

struct MovieViewModel {
    var title: String?
    var overview: String?
    var releaseDate: Date?
    var posterUrlString: String?
    
    var dateString: String {
        //TODO: show release date in a pretty formate
        return releaseDate?.description ?? "No Date!"
    }
}
