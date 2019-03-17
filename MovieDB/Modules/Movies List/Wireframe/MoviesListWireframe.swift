//
//  MoviesListWireframe.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class MoviesListWireframe: MoviesListWireframeProtocol {
    func openCreateNewMovieModule(view: MoviesListViewProtocol, delegate: MovieCreationDelegate) {
        guard let sourceView = view as? UIViewController else {
            return
        }
        let viewController = MovieCreationViewController()
        viewController.delegate = delegate
        sourceView.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}
