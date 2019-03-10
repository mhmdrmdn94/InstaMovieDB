//
//  HomeViewController.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToMoviesButtonTapped(_ sender: Any) {
        let viewController = MoviesListBuilder().buildMoviesListModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
