//
//  HomeViewController.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet fileprivate weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        homeButton.backgroundColor = InstaMovieColor.primary.value
        homeButton.setTitleColor(InstaMovieColor.secondry.value, for: .normal)
        homeButton.roundCorners(withRadius: 5)
    }
    
    @IBAction func goToMoviesButtonTapped(_ sender: Any) {
        let viewController = MoviesListBuilder().buildMoviesListModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
