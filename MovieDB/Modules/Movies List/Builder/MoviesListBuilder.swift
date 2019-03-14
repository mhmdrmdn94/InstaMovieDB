//
//  MoviesListBuilder.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class MoviesListBuilder: MoviesListBuilderProtocol {
    func buildMoviesListModule() -> UIViewController {
        let viewController = MoviesListViewController()
        let moviesService = MoviesService()
        let interactor = MoviesListInteractor(moviesService: moviesService)
        let wireframe = MoviesListWireframe()
        let presenter = MoviesListPresenter(view: viewController,
                                            interactor: interactor,
                                            wireframe: wireframe)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
